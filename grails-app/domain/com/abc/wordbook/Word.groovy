package com.abc.wordbook

import java.util.Date;

class Word {

    static belongsTo = [note:Note]
    
    String word
    WordCategory category
    String translation
    String definitionSentence
    String exampleSentence
    Date dateCreated
    Date lastUpdated
    
    String toString(){
        return word
    }
    
    static constraints = {
        word(blank:false)
        category(blank:false)
        translation(blank:false)
        definitionSentence()
        exampleSentence(blank:false)
    }
    
    static mapWith = "mongo"
    
    static mapping = {
        note attr: "noteId"
        category attr:"wordCategoryId"
    }
}
