package harbor

class LoanAction {
	
	String action
	
	static belongsTo = [Loan]
	
    static constraints = {
		action(blank:false)
    }
	
	static mapping =  {
		table "loan_actions"
		id sqlType: "int"
		version false
	}
	
	String toString() {
		action
	}
}
