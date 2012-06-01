package it.bolzano.comune.bauamtWeb
/**
 * The VtipoOpera entity.
 *
 * @author    
 *
 *
 */
class TipoOpera {
    static mapping = {
         table 'TIPO_OPERA'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column:'ID'
    }
    String beschreibungDe
    String beschreibungIt
    String beschreibungLa
    Integer tipoRichiesta
    Integer tipoIntervento
    Long idVerwaltungsakt

    static constraints = {
        id(size: 0..10)
        beschreibungDe(size: 1..200, blank: false)
        beschreibungIt(size: 0..200)
        beschreibungLa(size: 0..200)
        tipoRichiesta(nullable: true)
        tipoIntervento(nullable: true)
        idVerwaltungsakt(nullable: true, size: 0..10)
    }
    String toString() {
        return "${beschreibungIt}" 
    }
}
