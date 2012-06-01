package it.bolzano.comune.bauamtWeb
/**
 * The VdetailLageParzellen entity.
 *
 * @author    
 *
 *
 */
class DetailLageParzellen {
    static mapping = {
         table 'DETAIL_LAGE_PARZELLEN'
         // version is set to false, because this isn't available by default for legacy databases
         version false
		 bauAkt column: 'ba_Id'
		 id column:'id'
    }
	
	static belongsTo = [bauAkt:Bauakte]	
	
    String kgBeschreibungDe
    String kgBeschreibungIt
	Long parztypId
    String parztypDe
    String parztypIt
    String nummer
    String materielleanteil
    String einlagezahl
    Long baId
	Long katastalgemId

	String toString() {
        return "${kgBeschreibungIt}" 
    }
}
