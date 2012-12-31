package com.abc.wordbook

class Note {
    
    String title
    String content
    Date dateCreated
    Date lastUpdated
    
    String toString(){
        return title
    }

    static hasMany = [words : Word]
    static fetchMode = [words : 'eager']
    
    static constraints = {
        title()
        content()
    }
    
    static mapWith = "mongo"
}
