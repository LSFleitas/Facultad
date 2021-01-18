import mensajeros.*

object mensajeria {
	const mensajeros = []
	const pendientes = []
	const enviados = []
	var facturacion = 0
	
	method mensajeros() {
		return mensajeros
	}
	
	method contratar(unMensajero) {
		mensajeros.add(unMensajero)
	}
	
	method contratarTodos() {
		self.contratar(roberto)
		self.contratar(neo)
		self.contratar(chuck)
	}
	
	method despedirMensajero(unMensajero) {
		mensajeros.remove(unMensajero)
	}
	
	method despedirTodos() {
		mensajeros.clear()
	}
	
	method esGrande() {
		return mensajeros.size() > 2
	}
	
	method elPrimeroPuedeEntregarlo(unPaquete) {
		unPaquete.puedeSerEntregadoPor(mensajeros.first())
	}
	
	method pesoDelUltimo() {
		return mensajeros.last().peso()
	}
	
	method alguienPuedeEntregar(unPaquete) {
		return not self.candidatosPara(unPaquete).isEmpty()
	}
	
	method candidatosPara(unPaquete) {
		return mensajeros.filter( { men => unPaquete.puedeSerEntregadoPor(men) } )
	}
	
	method tieneSobrepeso() {
		return ( mensajeros.sum( { men => men.peso() } ) / mensajeros.size() ) > 500
	}
	
	method enviarPaquete(unPaquete) {
		if ( self.alguienPuedeEntregar(unPaquete) && unPaquete.estaPago() )
			{
			enviados.add(unPaquete)
			facturacion += unPaquete.precio()
			}
		else
			pendientes.add(unPaquete)
	}
	
	method facturacion() {
		return facturacion
	}
	
	method enviar(variosPaquetes) {
		variosPaquetes.forEach( { paq => self.enviarPaquete(paq) } )
	}
	
	method pendientes() {
		return pendientes
	}
	
	method enviados() {
		return enviados
	}
	
	method pendienteMasCaro() {
		return pendientes.map( { paq => paq.precio() } ).max()
	}
	
	method enviarPendienteMasCaro() {
		self.enviarPaquete( pendientes.find( { paq => paq.precio() == self.pendienteMasCaro() } ) )
	}
}