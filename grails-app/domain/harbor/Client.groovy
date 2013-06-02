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
	String memberOf
	String distinguishedName
	boolean inactive
	
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
		memberOf(maxSize:1000)
		distinguishedName()
		inactive()
    }
	
	String toString() {
		"${firstName} ${lastName}"
	}
}
