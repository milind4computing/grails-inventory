package harbor

class Type {
	
	String type
	
    static constraints = {
		type(blank:false)
    }
	
	static mapping = {
		table "asset_type"
	}
	
	String toString() {
		type
	}
}
