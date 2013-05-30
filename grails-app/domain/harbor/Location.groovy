package harbor

class Location {
	
	String location
	String specific
	
	static hasMany = [updates: Update]
	
    static constraints = {
		location(blank:false)
		specific()
    }
	
	static mapping = {
		table "asset_location"
	}
	
	String toString() {
		"${location} ${specific}"
	}
}
