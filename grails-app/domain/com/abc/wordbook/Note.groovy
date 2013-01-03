package com.abc.wordbook

import com.abc.wordbook.auth.User

class Note {
    
    static belongsTo = [user:User]
    
    String title
    String url
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
        url()
        content()
    }
    
//    static mapWith = "mongo"
    
}
