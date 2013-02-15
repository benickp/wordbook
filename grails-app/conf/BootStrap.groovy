import com.abc.wordbook.WordCategory
import com.abc.wordbook.auth.Role
import com.abc.wordbook.auth.User

class BootStrap {

    def shiroSecurityService

    def init = { servletContext ->
        //        def user = new User(username: "benickp", passwordHash: new Sha256Hash("password").toHex())
        //        user.addToPermissions("*:*")
        //        user.save()

        // Create the admin role
        def adminRole = Role.findByName('ROLE_ADMIN') ?:
                new Role(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)

        // Create the user role
        def memberRole = Role.findByName('ROLE_MEMBER') ?:
                new Role(name: 'ROLE_MEMBER').save(flush: true, failOnError: true)

        // Create an admin user
        def adminUser = User.findByUsername('admin') ?:
                new User(username: "admin",
                passwordHash: shiroSecurityService.encodePassword('abc12345'))
                .save(flush: true, failOnError: true)

        // Add roles to the admin user
        assert adminUser.addToRoles(adminRole)
        .addToRoles(memberRole)
        .save(flush: true, failOnError: true)

        // Create an standard user
        def standardUser = User.findByUsername('benickp') ?:
                new User(username: "benickp",
                passwordHash: shiroSecurityService.encodePassword('tmp12345'))
                .save(flush: true, failOnError: true)

        // Add role to the standard user
        assert standardUser.addToRoles(memberRole)
        .save(flush: true, failOnError: true)
        
        // Create an standard user
        def erich = User.findByUsername('erich.cheung') ?:
                new User(username: "erich.cheung",
                passwordHash: shiroSecurityService.encodePassword('abc12345'))
                .save(flush: true, failOnError: true)

        // Add role to the standard user
        assert erich.addToRoles(memberRole)
        .save(flush: true, failOnError: true)


        def currentDate = new Date();

        WordCategory.findByName('noun') ?: new WordCategory(name: 'noun', abbr:'n',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

        WordCategory.findByName('verb') ?: new WordCategory(name: 'verb', abbr:'v',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

        WordCategory.findByName('adjective') ?: new WordCategory(name: 'adjective', abbr:'abj',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

        WordCategory.findByName('adverb') ?: new WordCategory(name: 'adverb', abbr:'adv',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

        WordCategory.findByName('phrasal verb') ?: new WordCategory(name: 'phrasal verb', abbr:'ph v',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

        WordCategory.findByName('phrase') ?: new WordCategory(name: 'phrase', abbr:'ph',
                dateCreated: currentDate, lastUpdated: currentDate).save(flush: true, failOnError: true)

    }

    def destroy = {
    }
}
