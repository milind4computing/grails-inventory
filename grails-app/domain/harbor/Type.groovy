package harbor

class Type {
	
	String make
	String model
	
    static constraints = {
		make(blank:false)
		model(blank:false)
    }
	
	static mapping = {
		table "asset_type"
	}
	
	String toString() {
		"${make} ${model}"
	}
}
