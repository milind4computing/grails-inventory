package harbor

class State {
	
	String state
	
	static hasMany = [updates: Update]
	
    static constraints = {
		state(blank:false)
    }
	
	String toString() {
		state
	}
}
