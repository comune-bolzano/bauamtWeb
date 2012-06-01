class UrlMappings {

	static mappings = {
		"/"(controller:"bauakte", action:"list")		
		"500"(view:'/error')
		
		"/$controller/$action?/$id?"{
		}
		
		"/$controller/$id/$controller2?"(parseRequest:true){
			action = [GET:"show"]
			constraints { id(matches:/\d*/) }
		}

		"/$controller"(parseRequest:true){
			action = [GET:"list"]
		}
	}
}
