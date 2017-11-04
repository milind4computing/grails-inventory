import harbor.Client;
import harbor.Location;
import harbor.State;
import harbor.User;
import harbor.Type;
import harbor.Asset;

class BootStrap {

    def init = { servletContext ->
		
//		println "Creating states..."
//		new State(state: "Issuable", updates: [:]).save(failOnError:true)
//		new State(state: "Holding", updates: [:]).save(failOnError:true)
//		new State(state: "In for repair", updates: [:]).save(failOnError:true)
//		new State(state: "Issued", updates: [:]).save(failOnError:true)
//		new State(state: "Not working", updates: [:]).save(failOnError:true)
//		new State(state: "Part out", updates: [:]).save(failOnError:true)
//		new State(state: "Service Pool", updates: [:]).save(failOnError:true)
//		new State(state: "Stolen", updates: [:]).save(failOnError:true)
//		new State(state: "Surplused", updates: [:]).save(failOnError:true)
//		
//		println "Creating locations..."
//		new Location(location: "L163", moreSpecific: "Rack 1A", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 1B", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 1C", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 1D", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 1E", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 2A", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 2B", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 2C", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 2D", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 2E", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 3A", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 3B", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 3C", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 3D", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 3E", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 4A", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 4B", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 4C", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 4D", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack 4E", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Rack C4", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Cage 1", updates: [:]).save(failOnError:true)
//		new Location(location: "L163", moreSpecific: "Unspecified", updates: [:]).save(failOnError:true)
//		new Location(location: "Missing", moreSpecific: "", updates: [:]).save(failOnError:true)
//		new Location(location: "Storage", moreSpecific: "", updates: [:]).save(failOnError:true)
//		new Location(location: "Surplused", moreSpecific: "", updates: [:]).save(failOnError:true)
//		
//		println "Creating users..."
		new User(username:"milind", password: User.hashPassword("password"), permissions:"admin", firstName:"Milind", lastName:"Sharma", 
			email:"milind4computing@gmail.com", department:"The HUB", updates:[:]).save(failOnError:true)
//		new User(username:"cread", password: User.hashPassword("password"), permissions:"admin", firstName:"Charles", lastName:"Read", 
//			email:"CharlesRead@mail.clayton.edu", department:"Admin Systems", updates:[:]).save(failOnError:true)
//		new User(username:"user1", password: User.hashPassword("password"), permissions:"", firstName:"User", lastName:"One", 
//			email: "user1@clayton.edu", department:"Student", updates:[:]).save(failOnError:true)
//		new User(username:"user2", password: User.hashPassword("password"), permissions:"", firstName:"User", lastName:"Two", 
//			email: "user2@clayton.edu", department:"Student", updates:[:]).save(failOnError:true)
//		
//		println "Creating makes..."
//		new Type(make:"Apple", model:"MacBook Pro").save(failOnError:true)
//		new Type(make:"Apple", model:"iPad").save(failOnError:true)
//		new Type(make:"Dell", model:"D800").save(failOnError:true)
//		new Type(make:"Dell", model:"D810").save(failOnError:true)
//		new Type(make:"Dell", model:"D820").save(failOnError:true)
//		new Type(make:"Dell", model:"D830").save(failOnError:true)
//		new Type(make:"Dell", model:"D630").save(failOnError:true)
//		new Type(make:"Dell", model:"E6500").save(failOnError:true)
//		new Type(make:"Dell", model:"E6510").save(failOnError:true)
//		new Type(make:"Dell", model:"E6520").save(failOnError:true)
//		new Type(make:"Dell", model:"E6530").save(failOnError:true)
//		new Type(make:"Dell", model:"E6320").save(failOnError:true)
//		new Type(make:"Dell", model:"E6330").save(failOnError:true)
//		new Type(make:"Dell", model:"XPS 12").save(failOnError:true)
//		new Type(make:"Dell", model:"13").save(failOnError:true)
//		new Type(make:"Dell", model:"XT").save(failOnError:true)
//		new Type(make:"Lenovo", model:"X61").save(failOnError:true)
//		new Type(make:"Lenovo", model:"X201").save(failOnError:true)
//		new Type(make:"Lenovo", model:"X230").save(failOnError:true)
//		new Type(make:"Microsoft", model:"Surface Pro").save(failOnError:true)
//		
//		println "Creating assets..."
//		// Add asset params (hubId, serviceTag, typeId, locationId, userId, note)
//		Asset.add("10001", "6TqwP6TK4", "1", "3", "1", "Auto-creation.");
//		Asset.add("10002", "8TP5Tsrw3K", "2", "8", "1", "Auto-creation.");
//		Asset.add("10003", "12T23aa3K", "7", "5", "1", "Auto-creation.");
//		Asset.add("10004", "3TP5we13K", "6", "5", "1", "Auto-creation.");
//		Asset.add("10005", "914TweqsG1", "8", "4", "1", "Auto-creation.");
//		Asset.add("10006", "82s382KA", "9", "4", "1", "Auto-creation.");
//		Asset.add("10007", "qwwerq3K", "17", "5", "1", "Auto-creation.");
//		Asset.add("10008", "sfsd2231", "18", "4", "1", "Auto-creation.");
//		Asset.add("10009", "81aswe2KA", "9", "7", "1", "Auto-creation.");
//		Asset.add("10010", "wewqi2i2", "12", "7", "1", "Auto-creation.");
//		Asset.add("10011", "2knfkvf", "12", "6", "1", "Auto-creation.");
//		Asset.add("10012", "8f2c3c", "19", "4", "1", "Auto-creation.");
//		Asset.add("10013", "casd765h", "20", "5", "1", "Auto-creation.");
//		Asset.add("10014", "svsd3234", "20", "8", "1", "Auto-creation.");
//		Asset.add("10015", "234wsfdf", "9", "4", "1", "Auto-creation.");
//		Asset.add("10016", "6TagwTK4", "7", "3", "1", "Auto-creation.");
//		Asset.add("10017", "asPrtrw3K", "12", "8", "1", "Auto-creation.");
//		Asset.add("10018", "1ass23ty", "13", "5", "1", "Auto-creation.");
//		Asset.add("10019", "fgh46f6h", "5", "5", "1", "Auto-creation.");
//		Asset.add("10020", "a4g3erg", "9", "4", "1", "Auto-creation.");
//		Asset.add("10021", "sgge5rg4", "9", "4", "1", "Auto-creation.");
//		Asset.add("10022", "seg4egeg4", "15", "5", "1", "Auto-creation.");
//		Asset.add("10023", "segj686", "18", "4", "1", "Auto-creation.");
//		Asset.add("10024", "kytud46", "19", "7", "1", "Auto-creation.");
//		Asset.add("10025", "srth34t5", "11", "7", "1", "Auto-creation.");
//		Asset.add("10026", "35635634f", "10", "6", "1", "Auto-creation.");
//		Asset.add("10027", "hfgjty85", "9", "4", "1", "Auto-creation.");
//		Asset.add("10028", "yw455y56h", "16", "5", "1", "Auto-creation.");
//		Asset.add("10029", "54ywtrh", "4", "8", "1", "Auto-creation.");
//		Asset.add("10030", "hrt67687", "1", "4", "1", "Auto-creation.");
//		
//		println "Creating clients..."
//		new Client(username: "cscarborough", firstName: "Casey", lastName: "Scarborough", 
//			phone: "770-123-4567", email: "casey@caseyscarborough.com", office:"", 
//			department:"", description:"", memberOf:"", distinguishedName:"", inactive:false).save(failOnError:true)
//		new Client(username: "cread", firstName: "Charles", lastName: "Read", 
//			phone: "770-123-4567", email: "charles@charlesread.com", office:"", 
//			department:"", description:"", memberOf:"", distinguishedName:"", inactive:false).save(failOnError:true)
//		new Client(username: "jdoe", firstName: "John", lastName: "Doe", 
//			phone: "770-123-4567", email: "john@johndoe.com", office:"", 
//			department:"", description:"", memberOf:"", distinguishedName:"", inactive:false).save(failOnError:true)
//		new Client(username: "jdoe2", firstName: "Jane", lastName: "Doe", 
//			phone: "770-123-4567", email: "jane@janedoe.com", office:"", 
//			department:"", description:"", memberOf:"", distinguishedName:"", inactive:false).save(failOnError:true)
    }
    def destroy = {
    }
}
