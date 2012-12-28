package com.abc.wordbook

import java.util.Date;

class Word {

    static belongsTo = [note:Note]
    
    String word;
    String translation;
    String function;
    String definitionSentence
    String exampleSentence
    Date dateCreated
    Date lastUpdated
    
    static constraints = {
        word()
        translation()
        function(inList:['noun','verb','adverb','adjective','phrasal verb','phrase'])
        definitionSentence()
        exampleSentence()
    }
    
    static mapWith = "mongo"
}
