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
        
    }

    def destroy = {
    }
}
