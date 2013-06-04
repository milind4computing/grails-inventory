package harbor

class Loan {
	
	Asset asset
	Asset replacementAsset
	Client client
	User occurredBy
	Update update
	Update replacementUpdate
	LoanAction loanAction
	LoanActionReason loanActionReason
	Date occurredAt
	boolean userDamage
	
	static belongsTo = [LoanAction, LoanActionReason, Asset, Client, Update, User]
	
    static constraints = {
		asset()
		replacementAsset(nullable:true)
		client()
		occurredBy()
		update()
		replacementUpdate(nullable:true)
		loanAction()
		loanActionReason(nullable:true)
		occurredAt()
		userDamage()
    }
	
	static mapping = {
		table "loans"
		asset column: "asset_id", sqlType: "int"
		client column: "client_id", sqlType: "int"
		replacementAsset column: "replacement_asset_id", sqlType: "int"
		occurredAt column: "occured_at", sqlType: "datetime"
		loanAction column: "loan_action_id", sqlType: "int"
		update column: "history_id", sqlType: "int"
		userDamage column: "user_damage", sqlType: "tinyint"
		loanActionReason column: "loan_action_reason_id", sqlType: "int"
		replacementUpdate column: "replacement_history_id", sqlType: "int"
		version false
		
	}
	
	String toString() {
		occurredAt
	}
	
	static findLatestByAsset(Asset asset) {
		def loans = Loan.findAllByAsset(asset, [max:1, sort:"occurredAt", order:"desc"])
		loans[0]
	}
	
	static findLatestByClient(Client client) {
		def loans = Loan.findAllByClient(client, [max:1, sort:"occurredAt", order:"desc"])
		loans[0]
	}
}
