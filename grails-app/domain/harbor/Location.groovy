package harbor

class Location {
	
	String location
	String moreSpecific
	
	static hasMany = [updates: Update]
	
    static constraints = {
		location(blank:false)
		moreSpecific()
    }
	
	String toString() {
		"${location} ${moreSpecific}"
	}
}
