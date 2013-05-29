import harbor.Location;
import harbor.State;
import harbor.User;
import harbor.Type;
import harbor.Asset;

class BootStrap {

    def init = { servletContext ->
		
		println "Creating states..."
		new State(state: "Issuable", updates: [:]).save(failOnError:true)
		new State(state: "Holding", updates: [:]).save(failOnError:true)
		new State(state: "In for repair", updates: [:]).save(failOnError:true)
		new State(state: "Issued", updates: [:]).save(failOnError:true)
		new State(state: "Not working", updates: [:]).save(failOnError:true)
		new State(state: "Part out", updates: [:]).save(failOnError:true)
		new State(state: "Service Pool", updates: [:]).save(failOnError:true)
		new State(state: "Stolen", updates: [:]).save(failOnError:true)
		new State(state: "Surplused", updates: [:]).save(failOnError:true)
		
		println "Creating locations..."
		new Location(location: "L163", specific: "Rack 1A", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 1B", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 1C", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 1D", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 1E", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 2A", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 2B", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 2C", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 2D", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 2E", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3A", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3B", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3C", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3D", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3E", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 4A", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 4B", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 4C", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 4D", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 4E", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack C4", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Cage 1", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Unspecified", updates: [:]).save(failOnError:true)
		new Location(location: "Missing", specific: "", updates: [:]).save(failOnError:true)
		new Location(location: "Storage", specific: "", updates: [:]).save(failOnError:true)
		new Location(location: "Surplused", specific: "", updates: [:]).save(failOnError:true)
		
		println "Creating users..."
		new User(username:"cscarborough", password: User.hashPassword("password"), firstName:"Casey", lastName:"Scarborough", isAdmin:true, updates:[:]).save(failOnError:true)
		
		println "Creating types..."
		new Type(type:"Apple MacBook Pro").save(failOnError:true)
		new Type(type:"Apple iPad").save(failOnError:true)
		new Type(type:"Dell D800").save(failOnError:true)
		new Type(type:"Dell D810").save(failOnError:true)
		new Type(type:"Dell D820").save(failOnError:true)
		new Type(type:"Dell D830").save(failOnError:true)
		new Type(type:"Dell D630").save(failOnError:true)
		new Type(type:"Dell E6500").save(failOnError:true)
		new Type(type:"Dell E6510").save(failOnError:true)
		new Type(type:"Dell E6520").save(failOnError:true)
		new Type(type:"Dell E6530").save(failOnError:true)
		new Type(type:"Dell E6320").save(failOnError:true)
		new Type(type:"Dell E6330").save(failOnError:true)
		new Type(type:"Dell XPS 12").save(failOnError:true)
		new Type(type:"Dell 13").save(failOnError:true)
		new Type(type:"Dell XT").save(failOnError:true)
		new Type(type:"Lenovo X61").save(failOnError:true)
		new Type(type:"Lenovo X201").save(failOnError:true)
		new Type(type:"Lenovo X230").save(failOnError:true)
		new Type(type:"Microsoft Surface Pro").save(failOnError:true)
		
		println "Creating assets..."
		// Add asset params (hubId, serviceTag, typeId, locationId, userId, note)
		Asset.add("10001", "6TqwP6TK4", "1", "3", "1", "Auto-creation.");
		Asset.add("10002", "8TP5Tsrw3K", "2", "8", "1", "Auto-creation.");
		Asset.add("10003", "12T23aa3K", "7", "5", "1", "Auto-creation.");
		Asset.add("10004", "3TP5we13K", "6", "5", "1", "Auto-creation.");
		Asset.add("10005", "914TweqsG1", "8", "4", "1", "Auto-creation.");
		Asset.add("10006", "82s382KA", "9", "4", "1", "Auto-creation.");
		Asset.add("10007", "qwwerq3K", "17", "5", "1", "Auto-creation.");
		Asset.add("10008", "sfsd2231", "18", "4", "1", "Auto-creation.");
		Asset.add("10009", "81aswe2KA", "9", "7", "1", "Auto-creation.");
		Asset.add("10010", "wewqi2i2", "12", "7", "1", "Auto-creation.");
		Asset.add("10011", "2knfkvf", "12", "6", "1", "Auto-creation.");
		Asset.add("10012", "8f2c3c", "19", "4", "1", "Auto-creation.");
		Asset.add("10013", "casd765h", "20", "5", "1", "Auto-creation.");
		Asset.add("10014", "svsd3234", "20", "8", "1", "Auto-creation.");
		Asset.add("10015", "234wsfdf", "9", "4", "1", "Auto-creation.");
    }
    def destroy = {
    }
}
