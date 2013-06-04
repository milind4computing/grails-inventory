package harbor

class LoanActionReason {
	
	String reason
	
	static belongsTo = [Loan]
	
    static constraints = {
		reason(blank:false)
    }
	
	static mapping = {
		table "loan_action_reasons"
		id sqlType: "int"
		version false
	}
	
	String toString() {
		reason
	}
}
