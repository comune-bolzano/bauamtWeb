package it.bolzano.comune.bauamtWeb

import org.hibernate.FetchMode

class SitzungenController extends BaseController {

    // Imposto model di BaseController
    def beforeInterceptor = {
        model = Sitzungen
    }
	
    protected def doFind(params) {
	Sitzungen.createCriteria().get() {
            eq("id", new Long(params.id))
            fetchMode('bauakteSitzungen', FetchMode.JOIN)
            fetchMode('bauakteSitzungen.bauAkt', FetchMode.JOIN)
            fetchMode('bauakteSitzungen.bauAkt.persone', FetchMode.JOIN) 
            fetchMode('bauakteSitzungen.bauAkt.indirizzo', FetchMode.JOIN)
            fetchMode('bauakteSitzungen.bauAkt.zone', FetchMode.JOIN)           
        }
    }	
	
    def reset() {
	params.clear()
	render (view: "list", model: list())		
    }
		
    protected def doList(params) {
        if (!params.idSeduta &&
            !params.daDataSeduta && !params.aDataSeduta) {
            flash.message = "${message(code: 'almenouno.messaggio', default: 'Mindenstens eine option auswaehlen')}"
            return null 
	}  			
	flash.message = null
		
	Sitzungen.createCriteria().list(max:params.max, offset:params.offset) {			
            if (params.idSeduta && params.idSeduta.isNumber())
            eq("id", new Long(params.idSeduta))
		  			
            if (params.daDataSeduta)
            gte("sitzDatum", params.date('daDataSeduta', getDefaultDateFormat()))

            if (params.aDataSeduta)
            lte("sitzDatum", params.date('aDataSeduta', getDefaultDateFormat()))

            if (params.sort)
            order(params.sort, params.order)
            else
            order('sitzDatum', 'desc')  
        }
    }
	
}
