package harbor

class Update {
	
	Asset asset
	Location location
	String locationComment
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
		table "histories"
		id column: "id", sqlType: "int"
		asset column: "asset_id", sqlType: "int"
		location column: "location_id", sqlType: "int"
		locationComment column: "location_comment", sqlType: "text"
		state column: "state_id", sqlType: "int"
		occurredAt column: "occured_at", sqlType: "datetime"
		note column: "note", sqlType: "text"
		checkedOut column: "checked_out", sqlType: "tinyint"
		occurredBy column: "occured_by", sqlType: "int"
		checkedOut defaultValue: false
		version false
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
