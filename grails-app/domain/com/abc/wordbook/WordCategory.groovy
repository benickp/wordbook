package com.abc.wordbook

import java.util.Date;

class WordCategory {
    
    String name
    String abbr
    Date dateCreated
    Date lastUpdated
    
    String toString(){
        return name
    }

    static constraints = {
        name(blank:false,inList:['noun','verb','adverb','adjective','phrasal verb','phrase'],unique:true)
    }
    
//    static mapWith = "mongo"
}
