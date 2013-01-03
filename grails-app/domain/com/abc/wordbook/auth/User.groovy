package com.abc.wordbook.auth

import com.abc.wordbook.Note
import com.abc.wordbook.Word

class User {
    String username
    String passwordHash
    
    static hasMany = [ notes:Note,
                                  roles: Role, 
                                  permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
    
}
