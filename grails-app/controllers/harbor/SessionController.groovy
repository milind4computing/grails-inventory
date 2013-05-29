package harbor

class SessionController {
	
	def index() {
		redirect(action:"login")
	}
	
    def login() {}
	def logout() {
		if(session.user) {
			session.user = null
			session.invalidate()
			flash.message = "Successfully logged out."
			redirect(controller:'session', action:'login')
		}
	}
	
	def handleLogin() {
		params.password = User.hashPassword(params.password)
		def user = User.findByUsernameAndPassword(params.username, params.password)
		
		if(!user) {
			flash.message = "Username and password combination incorrect."
			redirect(controller:"session", action:"login")
			return
		} else {
			session.user = user
			flash.message = "Login successful! Resuming..."
			if(params.rc && params.ra) {
				redirect(controller:params.rc, action:params.ra)
			} else {
				redirect(controller:"home")
			}
			return
		}
	}
}