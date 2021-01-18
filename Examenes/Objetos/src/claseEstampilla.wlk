import claseEstampillaConmemorativa.*
import claseEstampillaOrdinaria.*
import claseHojitaBlock.*
import claseMiembro.*
import clasePais.*
import sociedad.*

class Estampilla {
	var valorFacial = 0
	var property anioDeEmision
	const pais
	
	method antiguedad() {
		return new Date().year() - anioDeEmision
	}
	
	method esAntigua() {
		return self.antiguedad() > 100
	}
	
	method esModerna() {
		return not self.esAntigua()
	}
		
	method esFallada() {
		return not anioDeEmision.between(pais.anioDeFundacion(), pais.anioDeDesaparicion())
	}
	
	method cotizacion() {
		return self.valorFacial() * pais.coeficiente() + self.incrementoPorAntiguedad()
	}
	
	method incrementoPorAntiguedad() {
		var incremento = 0
		if (self.esAntigua())
			incremento = (self.diferenciaAntiguedadMinima() * 5 ).min(150)
		return incremento
	}
	
	method diferenciaAntiguedadMinima() {
		return self.antiguedad() - 100
	}
	
	method esComun() {
		return sociedad.miembros().filter{miem => miem.coleccion().contains(self)}.size() > 10
	}
	
	method valorFacial() {
		return valorFacial
	}
	
	method pais() {
		return pais
	}
}