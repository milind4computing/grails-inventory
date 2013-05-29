import harbor.Location;
import harbor.State;
import harbor.User;
import harbor.Type;

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
		
    }
    def destroy = {
    }
}
