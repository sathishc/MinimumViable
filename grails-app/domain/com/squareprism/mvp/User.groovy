package com.squareprism.mvp

class User {

	transient springSecurityService

    String firstName
    String lastName

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    String md5UserName
    String featureNotificationFrequency

    String gender
    String generalDetails



	static constraints = {
        firstName blank: false
        lastName blank: false
		username blank: false, unique: true
		password blank: false

        md5UserName(nullable: true)
        featureNotificationFrequency(nullable: true)
        gender(nullable: true)
        generalDetails(nullable: true)

	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password,username)
	}
}
