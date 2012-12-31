package com.abc.wordbook

import org.springframework.dao.DataIntegrityViolationException

class WordCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [wordCategoryInstanceList: WordCategory.list(params), wordCategoryInstanceTotal: WordCategory.count()]
    }

    def create() {
        [wordCategoryInstance: new WordCategory(params)]
    }

    def save() {
        def wordCategoryInstance = new WordCategory(params)
        if (!wordCategoryInstance.save(flush: true)) {
            render(view: "create", model: [wordCategoryInstance: wordCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), wordCategoryInstance.id])
        redirect(action: "show", id: wordCategoryInstance.id)
    }

    def show(Long id) {
        def wordCategoryInstance = WordCategory.get(id)
        if (!wordCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "list")
            return
        }

        [wordCategoryInstance: wordCategoryInstance]
    }

    def edit(Long id) {
        def wordCategoryInstance = WordCategory.get(id)
        if (!wordCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "list")
            return
        }

        [wordCategoryInstance: wordCategoryInstance]
    }

    def update(Long id, Long version) {
        def wordCategoryInstance = WordCategory.get(id)
        if (!wordCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (wordCategoryInstance.version > version) {
                wordCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'wordCategory.label', default: 'WordCategory')] as Object[],
                          "Another user has updated this WordCategory while you were editing")
                render(view: "edit", model: [wordCategoryInstance: wordCategoryInstance])
                return
            }
        }

        wordCategoryInstance.properties = params

        if (!wordCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [wordCategoryInstance: wordCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), wordCategoryInstance.id])
        redirect(action: "show", id: wordCategoryInstance.id)
    }

    def delete(Long id) {
        def wordCategoryInstance = WordCategory.get(id)
        if (!wordCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "list")
            return
        }

        try {
            wordCategoryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'wordCategory.label', default: 'WordCategory'), id])
            redirect(action: "show", id: id)
        }
    }
}
