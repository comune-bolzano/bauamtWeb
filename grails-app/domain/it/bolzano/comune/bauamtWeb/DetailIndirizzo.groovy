package it.bolzano.comune.bauamtWeb
/**
 * The VdetailIndirizzo entity.
 *
 * @author    
 *
 *
 */
class DetailIndirizzo {
    static mapping = {
         table 'DETAIL_INDIRIZZO'
         // version is set to false, because this isn't available by default for legacy databases
         version false
		 bauAkt column: 'ba_Id'
		 id column:'id'
    }
	
	static belongsTo = [bauAkt:Bauakte]
	
    String indirizzoDe
    String indirizzoIt
    String viaDe
    String viaIt
    String frazioneDe
    String frazioneIt
    String adrText
    Integer ncivnume
    String ncivbarr
    String ncivscala
    Long baId
	Long cviacodi

    static constraints = {
        indirizzoDe(size: 0..148)
        indirizzoIt(size: 0..172)
        viaDe(size: 0..50)
        viaIt(size: 0..50)
        frazioneDe(size: 0..50)
        frazioneIt(size: 0..50)
        adrText(size: 0..240)
        ncivnume(nullable: true)
        ncivbarr(size: 0..5)
        ncivscala(size: 0..7)
        baId(size: 0..10)
    }
    String toString() {
        return "${indirizzoDe}" 
    }
}
