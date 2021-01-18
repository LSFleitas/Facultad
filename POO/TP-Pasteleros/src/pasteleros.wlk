class Ingrediente {
	const nombre
	var cantidad = 0
	
	method nombre() {
		return nombre
	}
	
	method cantidad() {
		return cantidad
	}
	
	method cambiarCantidad(unNumero) {
		cantidad = unNumero
	}
}

const chocolate = new Ingrediente(nombre = "chocolate")
const azucar = new Ingrediente(nombre = "azucar")
const harina = new Ingrediente(nombre = "harina")
const ingredienteVacio = new Ingrediente(nombre = "VACIO")


class Instrumento {
	const suerte = 0
	var parametro = 0
	
	method cambiarParametro(unNumero) {
		parametro = unNumero	
	}
	
	method suerte() {
		return suerte + parametro
	}
}

const cuchara = new Instrumento(suerte = 2)
const cuaderno = new Instrumento(parametro = 4)

object marcos {
	const ingredientes = [new Ingrediente(nombre = chocolate.nombre(), cantidad = 1200), new Ingrediente(nombre = azucar.nombre(), cantidad = 300), new Ingrediente(nombre = harina.nombre(), cantidad = 400)]
	var experiencia = 2
	
	method ingredientes() {
		return ingredientes
	}
	
	method cambiarExperiencia(unNumero) {
		experiencia = unNumero
	}
	
	method cantidadTotalDeIngredientes() {
		return ingredientes.sum( { ing => ing.cantidad() } ) / 1000
	}
	
	method nombresDeLosIngredientes() {
		return ingredientes.map( { ing => ing.nombre() } )
	}
	
	method capturar(unIngrediente) {
		if ( self.nombresDeLosIngredientes().contains(unIngrediente.nombre()) )
			return ingredientes.find( { ing => ing.nombre() == unIngrediente.nombre() } )
		else
			return "El ingrediente no existe."
	}
	
	method agregarIngrediente(unIngrediente, unaCantidad) {
		if ( self.nombresDeLosIngredientes().contains(unIngrediente.nombre()) )
			self.capturar(unIngrediente).cambiarCantidad(unaCantidad)
		else
			ingredientes.add(new Ingrediente(nombre = unIngrediente.nombre(), cantidad = unaCantidad))
		return ingredientes
	}
	
	method quitarIngrediente(unIngrediente) {
		ingredientes.remove(self.capturar(unIngrediente))
	}
	
	method quitarTodosLosIngredientes() {
		ingredientes.clear()
	}
	
	method habilidad() {
		return self.cantidadTotalDeIngredientes() + experiencia
	}
	
	method puedePrepararSuPostreFavorito() {
		return self.cantidadTotalDeIngredientes().even() && self.capturar(azucar).cantidad() > 100 && self.habilidad() > 5
	}
	
	method cantidadQueUtilizaPara(unPlato) {
		const interseccion = unPlato.nombresDeLosIngredientes().asSet().intersection(self.nombresDeLosIngredientes().asSet()).asList()
		var cantidad = 0
		var cantidadInterna
		var cantidadExterna
		if ( interseccion != [] )
			{
			cantidadInterna = ingredientes.filter( { ing => interseccion.contains(ing.nombre()) } ).sum( { ing => ing.cantidad() } ) / 1000
			cantidadExterna = unPlato.ingredientes().filter( { ing => interseccion.contains(ing.nombre()) } ).sum( { ing => ing.cantidad() } ) / 1000
			if ( cantidadInterna > cantidadExterna )
				cantidad = cantidadExterna
			else
				cantidad = cantidadInterna
			}
		return cantidad
	}
	
	method tiempo() {
		return 50
	}
}

object sonia {
	var ingrediente = new Ingrediente(nombre = chocolate.nombre(), cantidad = 1000)
	var instrumento = cuchara
	
	method ingrediente() {
		return ingrediente
	}
	
	method cambiarIngrediente(unIngrediente, unaCantidad) {
		ingrediente = new Ingrediente(nombre = unIngrediente.nombre(), cantidad = unaCantidad)
	}
	
	method cambiarInstrumento(unInstrumento) {
		instrumento = unInstrumento
	}
	
	method cantidadTotalDeIngredientes() {
		return ingrediente.cantidad() / 1000
	}
	
	method habilidad() {
		const auxi = 1 + self.cantidadTotalDeIngredientes()+ instrumento.suerte()
		if ( auxi > 10 )
			return 10
		else
			return auxi
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingrediente.nombre() == chocolate.nombre() && self.habilidad() > 5
	}
	
	method cantidadQueUtilizaPara(unPlato) {
		if ( self.cantidadTotalDeIngredientes() > unPlato.cantidadTotalDeIngredientes() )
			return unPlato.cantidadTotalDeIngredientes()
		else
			return self.cantidadTotalDeIngredientes()
	}
	
	method tiempo() {
		return 50 * 10 / self.habilidad()
	}
}

object samanta {
	const ingredientes = []
	
	method ingredientes() {
		return ingredientes
	}
	
	method habilidad() {
		return 9
	}
	
	method puedePrepararSuPostreFavorito() {
		return false
	}
	
	method cantidadTotalDeIngredientes() {
		return ingredientes.size()
	}
	
	method cantidadQueUtilizaPara(unPlato) {
		return 0
	}
	
	method tiempo() {
		return 30
	}
}

/* Lucas usa siempre dos ingredientes y siempre con cantidad 750 c/u. Además, tiene 5
 * años de experiencia. Su nivel de habilidad se calcula sumando su experiencia y la
 * cantidad de ingredientes. Cada vez que quiera agregar un ingrediente, se cambia el
 * primer ingrediente de la lista por el nuevo, de manera tal que el ingrediente que
 * antes ocupaba la segunda posicion ahora pasa a ocupar la primera, y el nuevo
 * ocupa ahora la segunda posicion. Si contiene dos ingredientes iguales, a cada uno
 * se le suma un plus de cantidad de 500. Puede hacer su postre favorito si tiene dos
 * ingredientes distintos. Para cocinar un plato, le coloca la cantidad de ingredientes
 * que requiere el plato, pero utilizando los ingredientes que tiene. Cocina el plato
 * la cantidad de tiempo pedido.
 */

object lucas {
	const ingredientes = [new Ingrediente(nombre = chocolate.nombre(), cantidad = 750), new Ingrediente(nombre = azucar.nombre(), cantidad = 750)]
	const experiencia = 5
	
	method ingredientes() {
		return ingredientes
	}
	
	
	method cambiarIngrediente(unIngrediente) {
		ingredientes.remove(ingredientes.first())
		ingredientes.add(new Ingrediente(nombre = unIngrediente.nombre(), cantidad = 750))
		if ( ingredientes.map( { ing => ing.nombre() } ).asSet().size() == 1 )
			ingredientes.forEach( { ing => ing.cambiarCantidad(750 + 500) } )
		else
			if ( ingredientes.first().cantidad() == 1250 )
				ingredientes.first().cambiarCantidad(750)
		return ingredientes
	}
	
	method cantidadDeIngredientes() {
		return ingredientes.sum( { ing => ing.cantidad() } )
	}
	
	method habilidad() {
		return experiencia +self.cantidadDeIngredientes() / 1000
	}
	
	method puedePrepararSuPostreFavorito() {
		return ingredientes.map( { ing => ing.nombre() } ).asSet().size() == 2
	}
	
	method cantidadTotalDeIngredientes() {
		return ingredientes.sum( { ing => ing.cantidad() } ) / 1000
	}
	
	method cantidadQueUtilizaPara(unPlato) {
		if ( self.cantidadTotalDeIngredientes() > unPlato.cantidadTotalDeIngredientes() )
			return unPlato.cantidadTotalDeIngredientes()
		else
			return self.cantidadTotalDeIngredientes()
	}
	
	method tiempo() {
		return 50
	}
}

object pasteleros {
	const pasteleros = #{marcos, sonia, samanta, lucas}
	
	method pasteleros() {
		return pasteleros
	}
	
	method mayorHabilidad(unConjuntoDePasteleros) {
		if ( unConjuntoDePasteleros != #{} )
			return unConjuntoDePasteleros.map( { pas => pas.habilidad() } ).max()
		else
			return "EL CONJUNTO ESTA VACIO"
	}
	
	method menorHabilidad(unConjuntoDePasteleros) {
		if ( unConjuntoDePasteleros != #{} )
			return unConjuntoDePasteleros.map( { pas => pas.habilidad() } ).min()
		else
			return "EL CONJUNTO ESTA VACIO"
	}
	
	method elMasHabilidoso(unConjuntoDePasteleros) {
		if ( unConjuntoDePasteleros != #{} )
			return unConjuntoDePasteleros.find( { pas => self.mayorHabilidad(unConjuntoDePasteleros) == pas.habilidad() } )
		else
			return "EL CONJUNTO ESTA VACIO"
	}
	
	method elMenosHabilidoso(unConjuntoDePasteleros) {
		if ( unConjuntoDePasteleros != #{} )
			return unConjuntoDePasteleros.find( { pas => self.menorHabilidad(unConjuntoDePasteleros) == pas.habilidad() } )
		else
			return "EL CONJUNTO ESTA VACIO"
	}
	
	method diferenciaEntreExtremos(unConjuntoDePasteleros) {
		if ( unConjuntoDePasteleros != #{} )
			return self.mayorHabilidad(unConjuntoDePasteleros) - self.menorHabilidad(unConjuntoDePasteleros)
		else
			return "EL CONJUNTO ESTA VACIO"
	}
	
	method losQuePreparanSuPostreFavorito() {
			return pasteleros.filter( { pas => pas.puedePrepararSuPostreFavorito() } )
	}
}