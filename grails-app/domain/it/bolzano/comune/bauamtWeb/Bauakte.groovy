package it.bolzano.comune.bauamtWeb
/**
 * The Vbauakte entity.
 *
 * @author    
 *
 *
 */
class Bauakte {
    static mapping = {
         table 'BAUAKTE'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column: 'BA_ID'
	 sort: ['jahr', 'nummer']
		 
	 persone sort:'sortingName'
	 indirizzo sort:'id', order:'asc'
	 particelle sort: 'katastalgemId'
	 sortingNummer formula: "jahr*10000+nummer"		 
    }
    
    String sortingNummer
    String baNummer
    Long nummer
    Long jahr
    Date eingangsdatum
    String eingangsprotnr
    String verantwortlicher
    Long verwaltungsaktId
    String verwaltungsaktDe
    String verwaltungsaktIt
    Long artId
    String artDe
    String artIt
    String beschreibungDe
    String beschreibungIt
    Date baubeginn
    Date bauende
    String archivnr
    String statusDe
    String statusIt
    
    static hasMany = [ persone: DetailPers, particelle: DetailLageParzellen, indirizzo: DetailIndirizzo, zone: DetailZonen, bauakteSitzungen: BauakteSitzungen, documenti: DetailDokumente]
	
    static constraints = {       
	id(size: 0..10)		
        baNummer(size: 0..122)
        eingangsdatum(nullable: true)
        eingangsprotnr(size: 0..50)
        verantwortlicher(size: 0..50)
        verwaltungsaktDe(size: 1..200, blank: false)
        verwaltungsaktIt(size: 1..200, blank: false)
        artDe(size: 1..200, blank: false)
        artIt(size: 0..200)
        beschreibungDe(size: 0..500)
        beschreibungIt(size: 0..500)
        baubeginn(nullable: true)
        bauende(nullable: true)
        archivnr(size: 0..200)
    }
	
    String toString() {
        return "${baId}" 
    }
}
