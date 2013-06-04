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
		memberOf(maxSize:1000, nullable:true)
		distinguishedName(nullable:true)
		inactive()
    }
	
	static mapping = {
		table "clients"
		id sqlType: "int"
		memberOf sqlType: "text"
		inactive sqlType: "tinyint"
		assets joinTable: [name: 'client_assets']
		version false
	}
	
	String toString() {
		"${firstName} ${lastName}"
	}
}
