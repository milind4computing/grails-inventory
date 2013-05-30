package harbor

class Asset {
	
	String hubId
	String serviceTag
	Type type
	
	static belongsTo = [Type]
	static hasMany = [updates: Update]
	
    static constraints = {
		hubId(blank:false, unique:true, matches:"[0-9]+")
		serviceTag(blank:false)
		type()
    }
	
	String toString() {
		hubId
	}
	
	static void add(String hubId, String serviceTag, String typeId, String locationId, String userId, String note=null) {
		def asset = new Asset(
			hubId: hubId, 
			serviceTag: serviceTag, 
			type: Type.findById(typeId)
		)
		asset.save(failOnError:true)
		
		def update = new Update(
			asset: asset, 
			location: Location.findById(locationId), 
			state: State.findByState("Holding"), 
			occurredAt: new Date(), 
			occurredBy: User.findById(userId), 
			note: note
		)
		update.save(failOnError:true)
	}
	
	void setServiceTag(String serviceTag) {
		this.serviceTag = serviceTag.toUpperCase()
	}
	
	Update[] getUpdateHistory() {
		Update.findAllByAsset(this, [max:25, sort:"occurredAt", order:"desc"])
	}
	
	Update getLatestUpdate() {
		def updates = Update.findAllByAsset(this, [max:1, sort:"occurredAt", order:"desc"])
		updates[0]
	}
	
	State getState() {
		getLatestUpdate().state
	}
	
	Location getLocation() {
		getLatestUpdate().location
	}
	
	// This is kind of hack-ish.
	static Asset[] getAssetsByState(State state) {
		def assets = Asset.list();
		ArrayList<Asset> assetsByState = new ArrayList<>();;
		assets.each { asset ->
			if(asset.state == state) {
				assetsByState.add(asset)
			}
		}
		assetsByState
	}
}
