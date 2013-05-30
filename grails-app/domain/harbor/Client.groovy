package harbor

class Client {

	String username
	String firstName
	String lastName
	String email
	String phone
	String office
	String department
	String description
	
	static hasMany = [assets: Asset]
	
    static constraints = {
		username(blank:false, unique:true)
		firstName(blank:false)
		lastName(blank:false)
		email()
		phone()
		office()
		department()
		description(maxSize:255)
    }
	
	String toString() {
		"${firstName} ${lastName}"
	}
}
