package it.bolzano.comune.bauamtWeb

class TipoParticelle {
    static mapping = {
         table 'PARZELLENTYP'
         // version is set to false, because this isn't available by default for legacy databases
         version false
         id column:'ID'
    }
    String beschreibungDe
    String beschreibungIt

    String toString() {
        return "${beschreibungIt}" 
    }
}
