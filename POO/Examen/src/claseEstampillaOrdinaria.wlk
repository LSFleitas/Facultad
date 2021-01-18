import claseEstampilla.*
import claseEstampillaConmemorativa.*
import claseHojitaBlock.*
import claseMiembro.*
import clasePais.*
import sociedad.*

class EstampillaOrdinaria inherits Estampilla {
	override method cotizacion() {
		if (self.esFallada())
			return 1000000
		else
			return super()
	}
}