package com.abc.wordbook

class Note {
    
    String title
    String content
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title()
        content()
    }
    
    static mapWith = "mongo"
}
