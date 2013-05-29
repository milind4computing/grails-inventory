package harbor

import org.apache.commons.codec.digest.DigestUtils;

class User {
	String username
	String password
	String firstName
	String lastName
	boolean isAdmin = false
	
	static hasMany = [updates: Update]
	
	static constraints = {
		username(blank:false)
		password(blank:false)
		firstName(blank:false)
		lastName(blank:false)
		isAdmin()
	}
	
	String toString() {
		username
	}
	
	static String hashPassword(String password) {
		DigestUtils.shaHex(password)
	}
}
