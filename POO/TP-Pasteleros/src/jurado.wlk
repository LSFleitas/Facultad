import pasteleros.*

class Plato {
	const ingredientes = []
	const tiempo = 0
	const creador = "VACIO"
	
	method ingredientes() {
		return ingredientes
	}
	
	method tiempo() {
		return tiempo
	}
	
	method creador() {
		return creador
	}
	
	method nombresDeLosIngredientes() {
		return ingredientes.map( { ing => ing.nombre() } )
	}
	
	method cantidadTotalDeIngredientes() {
		return ingredientes.sum( { ing => ing.cantidad() } ) / 1000
	}
}

const manteca = new Ingrediente(nombre = "manteca")

const tortaWollok = new Plato( ingredientes = [new Ingrediente(nombre = chocolate.nombre(), cantidad = 500), new Ingrediente(nombre = azucar.nombre(), cantidad = 300), new Ingrediente(nombre = harina.nombre(), cantidad = 600), new Ingrediente(nombre = manteca.nombre(), cantidad = 100)], tiempo = 50, creador = "Jurado" )

object jurado {
	const platos = [tortaWollok]
	const participantes = [marcos, sonia, samanta, lucas]
	
	method mandarAElaborar(unPastelero, unPlato) {
		return 10 - (unPlato.cantidadTotalDeIngredientes() - unPastelero.cantidadQueUtilizaPara(unPlato)) - (unPlato.tiempo() - unPastelero.tiempo())
	}
	
	method resultadosDe(unPlato) {
		return participantes.map( { par => self.mandarAElaborar(par, unPlato) } )
	}
	
	method resultadoMaximoDe(unPlato) {
		return self.resultadosDe(unPlato).max()
	}
	
	method ganadorDe(unPlato) {
		return participantes.find( { par => self.mandarAElaborar(par, unPlato) == self.resultadoMaximoDe(unPlato) } )
	}
	


}