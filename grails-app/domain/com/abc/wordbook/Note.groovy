package com.abc.wordbook

class Note {
    
    String title
    String content

    static constraints = {
        title()
        content()
    }
    
    static mapWith = "mongo"
}
