package com.abc.wordbook

import com.abc.wordbook.auth.User
import com.mysql.jdbc.Clob

class Note {
    
    static belongsTo = [user:User]
    
    String title
    String url
    String content
    String filename
    
    Date dateCreated
    Date lastUpdated
    
    String toString(){
        return title
    }

    static hasMany = [words : Word]
    static fetchMode = [words : 'eager']
    
    static constraints = {
        title(blank:false)
        url(nullable:true)
        content(blank:false)
    }
    
    static transients = ['content']
    
//    static mapWith = "mongo"
    
}
