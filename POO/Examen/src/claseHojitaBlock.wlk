import claseEstampilla.*
import claseEstampillaConmemorativa.*
import claseEstampillaOrdinaria.*
import claseMiembro.*
import clasePais.*
import sociedad.*

class HojitaBlock inherits EstampillaConmemorativa {
	const composicion = #{}
	
	override method valorFacial() {
		return composicion.sum{est => est.valorFacial()}
	}
	
	override method esFallada() {
		return not composicion.all{est => ( est.anioDeEmision() == anioDeEmision ) and ( est.pais() == pais )}
	}
	
	method composicion() {
		return composicion
	}
	
	override method cotizacion() {
		return super()
	}

}

