package it.bolzano.comune.bauamtWeb
/**
 * The Vbaukommissionsitzungen entity.
 *
 * @author    
 *
 *
 */
class Sitzungen {
	Date sitzDatum
	Long sitznr
	String nummer
	
	static hasMany = [bauakteSitzungen: BauakteSitzungen]
	
	static mapping = {
		table 'SITZUNGEN'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		id column:'ID'
		sort sitzDatum:"desc"	
		bauakteSitzungen sort:'orderbauakt'
    }

    String toString() {
        return "${nummer}" 
    }
}
