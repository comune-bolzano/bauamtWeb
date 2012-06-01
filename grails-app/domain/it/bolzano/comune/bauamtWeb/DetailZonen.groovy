package it.bolzano.comune.bauamtWeb
class DetailZonen {
	
    static mapping = {
         table 'DETAIL_ZONEN'
         // version is set to false, because this isn't available by default for legacy databases
         version false
	 bauAkt column: 'ba_Id'
	 id column:'id'
    }
	
    static belongsTo = [bauAkt:Bauakte]	
	
    String beschreibungDe
    String beschreibungIt
    Long baId

    String toString() {
        return "${beschreibungIt}" 
    }
}
