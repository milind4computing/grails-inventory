import harbor.Location;
import harbor.State;
import harbor.User;
import harbor.Type;
import harbor.Asset;

class BootStrap {

    def init = { servletContext ->
		
		new State(state: "Issuable", updates: [:]).save(failOnError:true)
		new State(state: "Holding", updates: [:]).save(failOnError:true)
		new State(state: "In for repair", updates: [:]).save(failOnError:true)
		
		new Location(location: "L163", specific: "Rack 3A", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3B", updates: [:]).save(failOnError:true)
		new Location(location: "L163", specific: "Rack 3C", updates: [:]).save(failOnError:true)
		
		new User(username:"cscarborough", password: User.hashPassword("password"), firstName:"Casey", lastName:"Scarborough", isAdmin:true, updates:[:]).save(failOnError:true)
		
		new Type(type:"Dell E6500").save(failOnError:true)
		new Type(type:"Dell E6510").save(failOnError:true)
		new Type(type:"Dell E6520").save(failOnError:true)
		
		Asset.add("10001", "6TP6TK4", "1", "3", "1", "");
		Asset.add("10002", "8TP5T3K", "2", "2", "1", "");
		Asset.add("10003", "12T233K", "3", "1", "1", "");
		Asset.add("10004", "3TP513K", "2", "2", "1", "");
		Asset.add("10005", "914TG1K", "1", "1", "1", "");
		
    }
    def destroy = {
    }
}
