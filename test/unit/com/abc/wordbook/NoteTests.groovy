package com.abc.wordbook



import grails.test.mixin.*
import org.junit.*

import com.abc.wordbook.auth.User;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Note)
class NoteTests {

//    void testSomething() {
//       fail "Implement me"
//    }
    
    void testUser(){
        def user = User.findByUsername("benickp")
        assertEquals "benickp", user.username
    }
}
