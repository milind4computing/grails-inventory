package harbor

class State {
	
	String state
	
	static hasMany = [updates: Update]
	
    static constraints = {
		state(blank:false)
    }
	
	static mapping = {
		table "states"
		id sqlType: "int"
		state column: "status"
		version false
	}
	
	String toString() {
		state
	}
	
	static ArrayList<State> getStates() {
		State.findAllByStateNotEqual("Issued")
	}
}
