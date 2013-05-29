package harbor

class Location {
	
	String location
	String specific
	
	static hasMany = [updates: Update]
	
    static constraints = {
		location(blank:false)
		specific()
    }
	
	String toString() {
		"${location} ${specific}"
	}
}
