package it.bolzano.comune.bauamtWeb

class DetailDokumente {
    static mapping = {
         table 'DETAIL_DOKUMENTE'
         // version is set to false, because this isn't available by default for legacy databases
         version false
	 bauAkt column: 'ba_Id'
	 id column:'dokumentnr'
    }
	
    static belongsTo = [bauAkt:Bauakte]

    Long dokumentjahr
    Date dokumentdatum 
    Long baId
	
    String toString() {
        return "${id}" 
    }
}
