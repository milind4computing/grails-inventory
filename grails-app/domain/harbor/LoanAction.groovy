package harbor

class LoanAction {
	
	String action
	
	static belongsTo = [Loan]
	
    static constraints = {
		action(blank:false)
    }
	
	String toString() {
		action
	}
}
