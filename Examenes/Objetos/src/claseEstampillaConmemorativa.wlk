import claseEstampilla.*
import claseEstampillaOrdinaria.*
import claseHojitaBlock.*
import claseMiembro.*
import clasePais.*
import sociedad.*

class EstampillaConmemorativa inherits Estampilla {
	const descripcion
	
	override method cotizacion() {
		if (self.esFallada())
			return 1000000
		else
			if ( descripcion.contains("Zarate") or descripcion.contains("Campana") )
				return super() * 3
			else
				return super() * 2
	}
}