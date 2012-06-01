package it.bolzano.comune.bauamtWeb
/**
 * The VdetailPers entity.
 *
 * @author    
 *
 *
 */
class DetailPers {
    static mapping = {
         table 'DETAIL_PERS'
         // version is set to false, because this isn't available by default for legacy databases
         version false
		 bauAkt column: 'ba_Id'
		 id column:'id'
		 sortingName formula: "CONCAT(kennung_Id,antragsteller)"		 
    }
	
	static belongsTo = [bauAkt:Bauakte]
	
	String sortingName		  
    String antragsteller
    String beschreibungDe
    String beschreibungIt
    String perstyp
    String familienname
    String vorname
    String firmenbezeichnungDe
    String firmenbezeichnungIt
    Long baId
	Long kennungId
	String professioneDe
	String professioneIt

    String toString() {
        return "${antragsteller}" 
    }
}
