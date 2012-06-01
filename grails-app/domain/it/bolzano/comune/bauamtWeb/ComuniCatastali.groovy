package it.bolzano.comune.bauamtWeb
/**
 * The VcomuniCatastali entity.
 *
 * @author    
 *
 *
 */
class ComuniCatastali {
    static mapping = {
         table 'COMUNI_CATASTALI'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column:'ID'
    }
    String beschreibungDe
    String beschreibungIt
    String beschreibungLa

    String toString() {
        return "${beschreibungIt}" 
    }
}
