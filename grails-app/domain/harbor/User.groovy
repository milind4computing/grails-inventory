package harbor

import org.apache.commons.codec.digest.DigestUtils;

class User {
	String username
	String password
	String permissions
	String firstName
	String lastName
	String email
	String department
	
	static hasMany = [updates: Update]
	
	static constraints = {
		username(blank:false)
		password(blank:false)
		firstName(blank:false)
		lastName(blank:false)
		permissions()
		email()
		department()
	}
	
	static mapping = {
		table "users"
		id sqlType: "int"
		version false
	}
	
	String toString() {
		username
	}
	
	static String hashPassword(String password) {
		DigestUtils.shaHex(password)
	}
}
