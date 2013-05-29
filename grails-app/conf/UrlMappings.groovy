class UrlMappings {

	static mappings = {
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home")
		"500"(view:'/error')
		"/asset/list/by/type/$id?"(controller:"asset", action:"listByType", id: id)
		"/asset/list/by/state/$id?"(controller:"state", action:"show", id: id)
		"/asset/list/by/location/$id?"(controller:"location", action:"show", id: id)

	}
}
