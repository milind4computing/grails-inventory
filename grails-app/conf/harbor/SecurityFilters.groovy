package harbor

class SecurityFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				if(!session.user
					&& !controllerName.equals("session")) {
					flash.message = "Please login first."
					forward(controller:"session", action:"login", params:[rc: params.controller, ra: params.action, rid: params.id])
					return
				}

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
