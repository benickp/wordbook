package com.abc.wordbook

import java.util.Date;

class Word {

    static belongsTo = [note:Note]
    
    String name;
    String translation;
    String function;
    String definitionSentence
    String exampleSentence
    Date dateCreated
    Date lastUpdated
    
    String toString(){
        return name
    }
    
    static constraints = {
        name()
        translation()
        function(inList:['noun','verb','adverb','adjective','phrasal verb','phrase'])
        definitionSentence()
        exampleSentence()
    }
    
    static mapWith = "mongo"
    
    static mapping = {
        note attr: "noteId"
    }
}
