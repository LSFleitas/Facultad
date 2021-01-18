import claseEstampilla.*
import claseEstampillaConmemorativa.*
import claseEstampillaOrdinaria.*
import claseHojitaBlock.*
import clasePais.*
import sociedad.*

class Miembro {
	const coleccion = []
	const paisesQueBusca = #{}
	
	method agregar(unaEstampilla) {
		coleccion.add(unaEstampilla)
	}
	
	method coleccion() {
		return coleccion
	}
	
	method cotizacionTotal() {
		return coleccion.sum{est => est.cotizacion()}
	}
	
	method cantidadDeEstampillasDe(unPais) {
		return coleccion.filter{est => est.pais() == unPais}.size()
	}
	
	method leInteresa(unPais) {
		return (not coleccion.contains(unPais)) and (paisesQueBusca.contains(unPais))
	}
}