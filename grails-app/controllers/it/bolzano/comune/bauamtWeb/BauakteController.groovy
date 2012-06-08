package it.bolzano.comune.bauamtWeb

class BauakteController extends BaseController {

    // Imposto model di BaseController
    def beforeInterceptor = {
        model = Bauakte
    }

    def reset() {
        params.clear()
        render (view: "list", model: list())		
    }
	
    protected def doList(params) {
        if (!params.tipoPratica && !params.tipoOpera && !params.baNummer && !params.archivnr &&
            !params.daDataPresentazione && !params.aDataPresentazione && 
            !params.daDataDeterminazione && !params.aDataDeterminazione &&
            !params.sedeOpera &&
            !params.comuneCatastale && !params.cognomeProgettista && !params.cognomeRichiedente) {
            flash.message = "${message(code: 'almenouno.messaggio', default: 'Mindenstens eine option auswaehlen')}"
            return null
        }  
        flash.message = null
					
        Bauakte.createCriteria().list(max:params.max, offset:params.offset) {
            if (params.tipoPratica && params.tipoPratica.isNumber())
                eq("verwaltungsaktId", new Long(params.tipoPratica))
			
            if (params.tipoOpera && params.tipoOpera.isNumber())
                eq("artId", new Long(params.tipoOpera))
			
            if (params.baNummer)
                eq("baNummer", params.baNummer)

            if (params.archivnr)
                eq("archivnr", params.archivnr)

			  			
            if (params.daDataPresentazione)
                gte("eingangsdatum", params.date('daDataPresentazione', getDefaultDateFormat()))

            if (params.aDataPresentazione)
                lte("eingangsdatum", params.date('aDataPresentazione', getDefaultDateFormat()))			   

            if (params.daDataDeterminazione && params.date('daDataDeterminazione', getDefaultDateFormat())) {
                def restriction = "exists (select dokumentnr from detail_dokumente doc where doc.ba_id = {alias}.ba_id AND doc.dokumentdatum >= TO_DATE('$params.daDataDeterminazione', '"+getDefaultDateFormat()+"'))"
                sqlRestriction restriction
			   
                /*
                documenti {
                gte("dokumentdatum", params.date('daDataDeterminazione', getDefaultDateFormat()))
                }
                 */	  
            }   

            if (params.aDataDeterminazione && params.date('aDataDeterminazione', getDefaultDateFormat())) {
                def restriction = "exists (select dokumentnr from detail_dokumente doc where doc.ba_id = {alias}.ba_id AND doc.dokumentdatum <= TO_DATE('$params.aDataDeterminazione', '"+getDefaultDateFormat()+"'))"
                sqlRestriction restriction
				
                /*
                documenti {
                lte("dokumentdatum", params.date('aDataDeterminazione', getDefaultDateFormat()))
                }
                 */	  
            }   
			   
            if (params.sedeOpera && params.sedeOpera.isNumber()) {
                def restriction = "exists (select id from detail_Indirizzo ind where ind.ba_id = {alias}.ba_id AND ind.cviacodi = $params.sedeOpera"
                if (params.civico && params.civico.isInteger())
                    restriction += " AND ind.ncivnume = $params.civico"
                if (params.barra && params.barra.isNumber())
                    restriction += " AND ind.ncivbarr = '${params.barra}'".toString()
                restriction += ")"
				   
                sqlRestriction restriction 			

                /*		   
                indirizzo {
                eq('cviacodi', new Long(params.sedeOpera))
                if (params.civico)
                eq('ncivnume', params.civico)   
                if (params.barra)
                eq('ncivbarr', params.barra)   
                }
                 */	  			  
            }  

            if (params.comuneCatastale && params.comuneCatastale.isNumber()) {
                def restriction = "exists (select id from detail_lage_parzellen par where par.ba_id = {alias}.ba_id AND par.katastalgem_Id = $params.comuneCatastale"		
				
                /*
                particelle {
                eq('katastalgemId', new Long(params.comuneCatastale))
                }
                 */
				
                if (params.pf)
                    restriction += " AND par.parztyp_id = 2 AND par.nummer = '${params.pf.toUpperCase().replaceAll('\'', '')}'"
				
                if (params.ped)
                    restriction += " AND par.parztyp_id = 1 AND par.nummer = '${params.ped.toUpperCase().replaceAll('\'', '')}'"
                
                if (params.pm)
                    restriction += " AND par.materielleanteil = '${params.pm.toUpperCase().replaceAll('\'', '')}'"
					   				
                restriction += ")"
			
                sqlRestriction restriction			
            }
			
            if (params.cognomeRichiedente) {
                def cognome = params.cognomeRichiedente.toUpperCase().replaceAll('\'', '')+"%"
                def restriction = "exists (select id from detail_pers per where per.kennung_id = 1 AND per.ba_id = {alias}.ba_id AND "+
                                  "(per.familienname like '${cognome}' OR "+
                                  "per.firmenbezeichnung_de like '${cognome}' OR "+
                                  "per.firmenbezeichnung_it like '${cognome}')"
                if (params.nomeRichiedente)
                    restriction += " AND per.vorname like '${params.nomeRichiedente.toUpperCase().replaceAll('\'', '')}'"
                restriction += ")".toString()
				
                sqlRestriction restriction

                /*
                persone {
                eq('familienname', params.cognomeRichiedente, [ignoreCase: true])
                if (params.nomeRichiedente)
                if (params.nomeRichiedente)
                eq('kennungId', new Long(1))
                }
                 */
            }
			  
            if (params.cognomeProgettista) {
                def cognome = params.cognomeProgettista.toUpperCase().replaceAll('\'', '')+"%"
                def restriction = "exists (select id from detail_pers per where per.kennung_id = 3 AND per.ba_id = {alias}.ba_id AND "+
                                  "(per.familienname like '${cognome}' OR "+
                                  "per.firmenbezeichnung_de like '${cognome}' OR "+
                                  "per.firmenbezeichnung_it like '${cognome}')"
                                
                if (params.nomeProgettista)
                   restriction += " AND per.vorname like '${params.nomeProgettista.toUpperCase().replaceAll('\'', '')}'"
                restriction += ")".toString()
				
                sqlRestriction restriction

                /*	
                persone {
                eq('familienname', params.cognomeProgettista, [ignoreCase: true])
                if (params.nomeProgettista)
                eq('vorname', params.nomeProgettista, [ignoreCase: true])
                eq('kennungId', new Long(3))
                }	
                 */   
            }  		    
		
            if (params.sort)
                order(params.sort, params.order)
            else
                order('sortingNummer', 'asc')
        }
    }
	
}
