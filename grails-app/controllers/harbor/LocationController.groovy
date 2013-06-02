package harbor

import org.springframework.dao.DataIntegrityViolationException

class LocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: ["POST","GET"]]

    def index() {
        if(session.user && session.user) {
			redirect(action: "list", params: params)
		}
    }
    def list(Integer max) {
		if(session.user && session.user.permissions.contains("admin")) {
	        params.max = Math.min(max ?: 15, 100)
	        [locationInstanceList: Location.list(params), locationInstanceTotal: Location.count()]
		} else {
			flash.message = "You are not authorized to access that page."
			redirect(controller:"home", action:"index")
		}
    }

    def create() {
        [locationInstance: new Location(params)]
    }

    def save() {
		if(session.user && session.user.permissions.contains("admin")) {
	        def locationInstance = new Location(params)
	        if (!locationInstance.save(flush: true)) {
	            render(view: "create", model: [locationInstance: locationInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
	        redirect(action: "show", id: locationInstance.id)
		} else {
			flash.message = "You are not authorized to access that page."
			redirect(controller:"home", action:"index")
		}
    }

    def show(Long id) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        [locationInstance: locationInstance]
    }

    def edit(Long id) {
		if(session.user && session.user.permissions.contains("admin")) {
			def locationInstance = Location.get(id)
	        if (!locationInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
	            redirect(action: "list")
	            return
	        }
			[locationInstance: locationInstance]
		} else {
			flash.message = "You are not authorized to access that page."
			redirect(controller:"home", action:"index")
		}
    }

    def update(Long id, Long version) {
        def locationInstance = Location.get(id)
        if (!locationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (locationInstance.version > version) {
                locationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'location.label', default: 'Location')] as Object[],
                          "Another user has updated this Location while you were editing")
                render(view: "edit", model: [locationInstance: locationInstance])
                return
            }
        }

        locationInstance.properties = params

        if (!locationInstance.save(flush: true)) {
            render(view: "edit", model: [locationInstance: locationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), locationInstance.id])
        redirect(action: "show", id: locationInstance.id)
    }

    def delete(Long id) {
		if(session.user && session.user.permissions.contains("admin")) {
			def locationInstance = Location.get(id)
			def assetsByLocation = Asset.getAssetsByLocation(locationInstance, 25);
			if(assetsByLocation.size() != 0) {
				flash.message = "Unable to remove location. It is currently in use."
				redirect(controller:"location", action:"list")
			} else {
				if (!locationInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), locationInstance])
					redirect(action: "list")
					return
				}
		
				try {
					locationInstance.delete(flush: true)
					flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), locationInstance])
					redirect(action: "list")
				}
				catch (DataIntegrityViolationException e) {
					flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'location.label', default: 'Location'), locationInstance])
					redirect(action: "show", id: id)
				}
			}
		} else {
			flash.message = "You are not authorized to access that page."
			redirect(controller:"home", action:"index")
		}
    }
}
