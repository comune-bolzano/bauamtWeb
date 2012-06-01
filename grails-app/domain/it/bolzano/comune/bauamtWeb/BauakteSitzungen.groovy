package it.bolzano.comune.bauamtWeb

class BauakteSitzungen {	
	
	static belongsTo = [bauAkt:Bauakte, sitzung:Sitzungen]
	
    String entschlussDe
    String entschlussIt
	String entscheidDe
    String entscheidIt
	String orderbauakt

	static mapping = {
		table 'BAUAKTE_SITZUNGEN'
		// version is set to false, because this isn't available by default for legacy databases
		version false
		id column:'ID'
		bauAkt column: 'IDBAUAKT'
		sitzung column: 'IDSITZUNG'
    }

    String toString() {
        return "${id}" 
    }
}
