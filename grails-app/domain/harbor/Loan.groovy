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
