package harbor

class Type {
	
	String make
	String model
	
    static constraints = {
		make(blank:false)
		model(blank:false)
    }
	
	static mapping = {
		table "asset_types"
		id column: "id", sqlType: "int"
		version false
	}
	
	String toString() {
		"${make} ${model}"
	}
}
