package harbor

class Asset {
	
	String hubId
	String serviceTag
	Type type
	
	static belongsTo = [Type]
	static hasMany = [updates: Update]
	
    static constraints = {
		hubId(blank:false, unique:true, matches:"[0-9]+",nullable: false)
		serviceTag(blank:false, nullable: false)
		type(nullable: false)
    }
	
	static mapping = {
		table "assets"
		id sqlType: "int"
		hubId column: "hub_id", sqlType: "int"
		serviceTag column: "service_tag"
		type column: "asset_type_id", sqlType: "int"
		version false
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
	
	/*
	 *  Class Methods
	 */
	
	static Asset[] getAssetsByState(State state, int max = Asset.list().size()) {
		// This is kind of hack-ish.
		def assets = Asset.list();
		ArrayList<Asset> assetsByState = new ArrayList<>();
		def count = 0;
		assets.each { asset ->
			if(asset.state == state) {
				assetsByState.add(asset)
			}
			count++;
			if(count >= max) {
				return assetsByState
			}
		}
		assetsByState
	}
	
	static Asset[] getAssetsByLocation(Location location, int max = Asset.list().size()) {
		// This is kind of hack-ish.
		def assets = Asset.list();
		ArrayList<Asset> assetsByLocation = new ArrayList<>();
		def count = 0;
		assets.each { asset ->
			if(asset.location == location) {
				assetsByLocation.add(asset)
			}
			count++;
			if(count >= max) {
				return assetsByLocation
			}
		}
		assetsByLocation
	}
	
	/*
	 * Instance methods
	 */
	boolean distribute(Client client, User user, String note) {
		if(issuable()) {
			def update = new Update(
				asset: this,
				location: Location.findByLocation("Issued"),
				state: State.findByState("Issued"),
				occurredAt: new Date(),
				occurredBy: User.get(user.id),
				note: note
			)
			update.save(failOnError:true)
			def loan = new Loan(
				asset: this,
				replacementAsset: null,
				client: client,
				occurredBy: user,
				update: Update.get(update.id),
				replacementUpdate: null,
				loanAction: LoanAction.findByAction("Distribution"),
				loanActionReason: null,
				occurredAt: new Date(),
				userDamage: false
			)
			loan.save(failOnError:true)
			return true
		} else {
			return false
		}
	}
	
	boolean issuable() {
		this.state == State.findByState("Issuable")
	}
}
