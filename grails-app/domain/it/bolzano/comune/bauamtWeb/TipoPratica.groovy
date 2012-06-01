package it.bolzano.comune.bauamtWeb
/**
 * The VtipoPratica entity.
 *
 * @author    
 *
 *
 */
class TipoPratica {
    static mapping = {
         table 'TIPO_PRATICA'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column:'ID'
    }
    String beschreibungDe
    String beschreibungIt
    String beschreibungLa
    Integer faelligTage

    String toString() {
        return "${beschreibungIt}" 
    }
}
