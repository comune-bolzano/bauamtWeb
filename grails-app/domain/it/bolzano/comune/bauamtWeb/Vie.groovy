package it.bolzano.comune.bauamtWeb
/**
 * The Vvia entity.
 *
 * @author    
 *
 *
 */
class Vie {
    static mapping = {
         table 'VIE'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column: 'CVIACODI'
    }
    String descrIt
    String descrDe

    static constraints = {
	id()
        descrIt(size: 0..50)
	descrDe(size: 0..50)
    }
    String toString() {
        return "${descrIt}" 
    }
}
