import claseEstampilla.*
import claseEstampillaConmemorativa.*
import claseEstampillaOrdinaria.*
import claseHojitaBlock.*
import claseMiembro.*
import clasePais.*

object sociedad {
	const miembros = #{}
	
	method agregar(alguien) {
		miembros.add(alguien)
	}
	
	method miembros() {
		return miembros
	}
	
	method integranteDeMayorCotizacion() {
		return miembros.max{miem => miem.cotizacionTotal()}
	}
	
	method leInteresaAAlguien(unPais) {
		return miembros.any{miem => miem.leInteresa(unPais)}
	}
}