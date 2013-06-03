package harbor

class Update {
	
	Asset asset
	Location location
	State state
	Date occurredAt
	User occurredBy
	String note
	boolean checkedOut
	
	static belongsTo = [Asset, Location, State, User]

    static constraints = {
		asset(blank:false)
		location()
		state()
		occurredBy()
		note(maxSize:1000, nullable:true)
		checkedOut()
    }
	
	static mapping = {
		table "asset_update"
		checkedOut defaultValue: false
	}
	
	String toString() {
		occurredAt.toString()
	}
	
	static void add(String hubId, String locationId, String stateId, String userId, String note, boolean checkedOut = false) {
		def update = new Update(
			asset: Asset.findByHubId(hubId),
			location: Location.findById(locationId),
			state: State.findById(stateId),
			occurredAt: new Date(),
			occurredBy: User.findById(userId),
			note: note,
			checkedOut: checkedOut
		)
		update.save()
	}
}
