// Mensajeros de pelicula, primera parte

object roberto {
	const peso = 90
	var transporte = camion

	method peso() {
		return peso + transporte.pesoVehiculo()
	}

	method transporte(vehiculo) {
		transporte = vehiculo
	}

	method puedeLlamar() {
		return false
	}
	
}

object neo {
	const peso = 0
 	var credito = true
 	
 	method peso() {
 		return peso
 		}
 	
 	method credito() {
 		return credito
 		}
 	
 	method gastarCredito() {
 		credito = false
 	}
 	
 	method puedeLlamar() {
 		return credito
 	}
 	
 }
 
object chuck {
	const peso = 900
	const credito = true

	method peso() {
		return peso
	}
	
	method puedeLlamar() {
		return credito
	}
 	
 }

object camion {
	var acoplados = 2

	method pesoVehiculo() {
		return acoplados * 500
	}

	method acoplados(cantAcoplados) {
		acoplados = cantAcoplados
	}
}

object bicicleta {

	method pesoVehiculo() {
		return 1
	} 
}

object brooklyn {

	method dejarPasar(mensajero) {
		return mensajero.peso() < 1000
	}
}

object matrix{
	
	method dejarPasar(mensajero) {
		return mensajero.puedeLlamar()
	}
}

object paquete {
	var pago = false
	var destino = brooklyn
	var precio = 50

	method estaPago() {
		return pago
	}
	
	method pagar( ) {
		pago = true
	}
	
	method destino(lugar) {
		destino = lugar
	}

	method puedeSerEntregadoPor(mensajero) {
		return destino.dejarPasar(mensajero)
	}
	
}

object paqueteFacil {
	var destino = brooklyn
	
	method destino(unDestino) {
		destino = unDestino
	}
	
	method puedeSerEntregadoPor(unMensajero) {
		return destino.dejarPasar()
	}
	
	method precio() {
		return 0
	}
	
	method estaPago() {
		return true
	}
	
}

object paquetonViajero {
	const destinos = []
	var pagado = 0
	
	method destino(unDestino) {
		destinos.add(unDestino)
	}
	
	method precio() {
		return precio
	}
	
	method pagar(unaCantidad) {
		pagado += unaCantidad
	}
	
	method destino() {
		return destinos
	}
	
	method estaPago() {
		return pagado >= self.precio()
	}
	
	method puedeSerEntregadoPor(unMensajero) {
		return destinos.all( { des => des.dejarPasar(unMensajero) } )
	}
}
