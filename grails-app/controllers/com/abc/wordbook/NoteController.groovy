package com.abc.wordbook

import java.text.SimpleDateFormat

import org.apache.commons.io.FileUtils
import org.apache.shiro.SecurityUtils
import org.springframework.dao.DataIntegrityViolationException

import com.abc.wordbook.auth.User

class NoteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [noteInstanceList: Note.list(params), noteInstanceTotal: Note.count()]
    }

    def create() {
        def noteInstance = new Note(params)
        
        def principal = SecurityUtils.subject?.principal
        if( principal!=null ){
            noteInstance.user = User.findByUsername(principal)
        }
        
        [noteInstance: noteInstance]
        
//        [noteInstance: new Note(params)]
    }
    
    def saveContentToFile(noteInstance, params){
        // Save HTML content to a file
        def dataFomat = new SimpleDateFormat("yyyyMMddHHmmss");
        def fileStore = new File("note_${dataFomat.format(new Date())}.html");
        fileStore.createNewFile();
        FileUtils.writeStringToFile(fileStore, params.content);
        noteInstance.filename = fileStore.absolutePath;
    }

    def save() {
        def noteInstance = new Note(params)
        saveContentToFile(noteInstance, params)
        
        // Save HTML content to a file
//        def dataFomat = new SimpleDateFormat("yyyyMMddHHmmss");
//        def fileStore = new File("note_${dataFomat.format(new Date())}.html");
//        fileStore.createNewFile();
//        FileUtils.writeStringToFile(fileStore, params.content);
//        noteInstance.filename = fileStore.absolutePath;

        if (!noteInstance.save(flush: true)) {
            render(view: "create", model: [noteInstance: noteInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])
        redirect(action: "show", id: noteInstance.id)
    }

    def show(Long id) {
        def noteInstance = Note.get(id)
        if (!noteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }
        
        def fileStore = new File(noteInstance.filename);
        noteInstance.content = FileUtils.readFileToString(fileStore);
        [noteInstance: noteInstance]
    }

    def edit(Long id) {
        def noteInstance = Note.get(id)
        if (!noteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }

        def fileStore = new File(noteInstance.filename);
        noteInstance.content = FileUtils.readFileToString(fileStore);
        [noteInstance: noteInstance]
    }

    def update(Long id, Long version) {
        def noteInstance = Note.get(id)
        if (!noteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (noteInstance.version > version) {
                noteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'note.label', default: 'Note')] as Object[],
                          "Another user has updated this Note while you were editing")
                render(view: "edit", model: [noteInstance: noteInstance])
                return
            }
        }

        noteInstance.properties = params
        saveContentToFile(noteInstance, params)

        if (!noteInstance.save(flush: true)) {
            render(view: "edit", model: [noteInstance: noteInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'note.label', default: 'Note'), noteInstance.id])
        redirect(action: "show", id: noteInstance.id)
    }

    def delete(Long id) {
        def noteInstance = Note.get(id)
        if (!noteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
            return
        }

        try {
            noteInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'note.label', default: 'Note'), id])
            redirect(action: "show", id: id)
        }
    }
}
