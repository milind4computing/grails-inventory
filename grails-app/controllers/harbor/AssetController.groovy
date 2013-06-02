package harbor

import org.apache.jasper.compiler.Node.ParamsAction;
import org.springframework.dao.DataIntegrityViolationException

class AssetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		if(session.user) {
			redirect(action: "list", params: params)
		}
    }

    def list(Integer max) {
        def assets	
		if(params.hubId) {
			assets = Asset.findAllByHubIdLike("%${params.hubId}%", [max:25])
			if (assets == null) {
				flash.message = "No assets found for HUB ID: ${params.hubId}"
				redirect(action:'search')
			} else {
				[assetInstanceList: assets, assetInstanceTotal: Asset.count()]
			}
		} else if (params.hubId == "") { 
			flash.message = "Please enter a search term."
			redirect(action:'search')
    	} else if (params.typeId) {
			def type = Type.findById(params.typeId)
			assets = Asset.findAllByType(type)
    	} else if (params.stateId) {
			def state = State.findById(params.stateId)
			assets = Asset.findAllByState(state)
    	} else if (params.locationId) {
			def location = Location.findById(params.locationId)
			assets = Asset.findAllByLocation(location)
    	} else {
			[assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
		}
		
		[assetInstanceList: assets, assetInstanceTotal: Asset.count()]
    }

    def create() {
		if(session.user && session.user.permissions.contains("admin")) {
			[assetInstance: new Asset(params)]
		} else {
			flash.message = "You do not have rights to create assets."
			redirect(action:"search")
		}
    }
	
	def listByType(Long id) {
		forward(action:"list", params:[typeId: id])
	}
	
	def listByState(Long id) {
		forward(action:"list", params:[stateId: id])
	}
	
	def listByLocation(Long id) {
		forward(action:"list", params:[locationId: id])
	}

    def save() {
		if(session.user && session.user.permissions.contains("admin")) {
			if(params.hubId.matches("[0-9]+")) {
				try {
					Asset.add(params.hubId, params.serviceTag, params.type.id, params.location.id, session.user.id.toString(), "Initial creation.")
					flash.message = "Asset successfully created!"
					redirect(action:"search")
				} catch (Exception e) {
					flash.message = "An error occurred."
					redirect(action:"create")
				}
			} else {
				flash.message = "HUB ID can only be numbers"
				redirect(action:"create")
			}
		} else {
			flash.message = "You do not have rights to create assets."
			redirect(action:"search")
		}
    }

    def show(Long id) {
		if(session.user){
	        def assetInstance = Asset.findByHubId(id)
	        if (!assetInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [assetInstance: assetInstance]
		}
    }

    def edit(Long id) {
        def assetInstance = Asset.get(id)
        if (!assetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), id])
            redirect(action: "list")
            return
        }

        [assetInstance: assetInstance]
    }

    def update(Long id, Long version) {
		render params
		if(session.user) {
			Update.add(params.hubId, params.locationId, params.stateId, session.user.id.toString(), params.note)
			flash.message = "Asset successfully updated."
			redirect(controller:"asset", action:"show", id: params.hubId)
		} else {
			flash.message = "You are not authorized to update assets."
			redirect(controller:"session", action:"login")
		}
    }

    def delete(Long id) {
        def assetInstance = Asset.get(id)
        if (!assetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), id])
            redirect(action: "list")
            return
        }

        try {
            assetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asset.label', default: 'Asset'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def search() {}
}
