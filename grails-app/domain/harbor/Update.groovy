package harbor

class Update {
	
	Asset asset
	Location location
	State state
	Date occurredAt
	User occurredBy
	String note
	
	static belongsTo = [Asset, Location, State, User]

    static constraints = {
		asset(blank:false)
		location()
		state()
		occurredBy()
		note(maxSize:1000, nullable:true)
    }
	
	String toString() {
		occurredAt.toString()
	}
}
