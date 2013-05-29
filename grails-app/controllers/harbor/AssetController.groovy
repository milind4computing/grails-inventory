package harbor

import org.springframework.dao.DataIntegrityViolationException

class AssetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def hubId = params.hubId
		if(hubId) {
			def assets = Asset.findAllByHubIdLike("%${hubId}%")
			if (assets == null) {
				flash.message = "No assets found for HUB ID: ${hubId}"
				redirect(action:'search')
			} else {
				[assetInstanceList: assets, assetInstanceTotal: Asset.count()]
			}
		} else if (hubId == "") { 
			flash.message = "Please enter a search term."
			redirect(action:'search')
    	} else {
			[assetInstanceList: Asset.list(params), assetInstanceTotal: Asset.count()]
		}
    }

    def create() {
		if(session.user && session.user.isAdmin) {
			[assetInstance: new Asset(params)]
		} else {
			flash.message = "You do not have rights to create assets."
			redirect(action:"search")
		}
    }

    def save() {
		if(session.user && session.user.isAdmin) {
			Asset.add(params.hubId, params.serviceTag, params.type.id, params.location.id, session.user.id.toString(), "")
			flash.message = "Asset successfully created!"
			redirect(action:"list")
		} else {
			flash.message = "You do not have rights to create assets."
			redirect(action:"search")
		}
//        def assetInstance = new Asset(params)
//        if (!assetInstance.save(flush: true)) {
//            render(view: "create", model: [assetInstance: assetInstance])
//            return
//        }
//
//        flash.message = message(code: 'default.created.message', args: [message(code: 'asset.label', default: 'Asset'), assetInstance.id])
//        redirect(action: "show", id: assetInstance.id)
    }

    def show(Long id) {
        def assetInstance = Asset.findByHubId(id)
        if (!assetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asset.label', default: 'Asset'), id])
            redirect(action: "list")
            return
        }

        [assetInstance: assetInstance]
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
