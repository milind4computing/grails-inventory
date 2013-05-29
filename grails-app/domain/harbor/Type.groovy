package harbor

class Type {
	
	String type
	
    static constraints = {
		type(blank:false)
    }
	
	String toString() {
		type
	}
}
