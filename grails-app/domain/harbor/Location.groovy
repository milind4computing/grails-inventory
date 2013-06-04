package harbor

class Location {
	
	String location
	String moreSpecific
	
	static hasMany = [updates: Update]
	
    static constraints = {
		location(blank:false)
		moreSpecific()
    }
	
	static mapping =  {
		table "locations"
		id sqlType: "int"
		version false
	}
	
	String toString() {
		"${location} ${moreSpecific}"
	}
}
