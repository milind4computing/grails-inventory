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
	
	static void add(String hubId, String locationId, String stateId, String userId, String note) {
		def update = new Update(
			asset: Asset.findByHubId(hubId),
			location: Location.findById(locationId),
			state: State.findById(stateId),
			occurredAt: new Date(),
			occurredBy: User.findById(userId),
			note: note
		)
		update.save()
	}
}
