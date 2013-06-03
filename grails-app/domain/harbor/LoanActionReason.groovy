package harbor

class LoanActionReason {
	
	String reason
	
	static belongsTo = [Loan]
	
    static constraints = {
		reason(blank:false)
    }
	
	String toString() {
		reason
	}
}
