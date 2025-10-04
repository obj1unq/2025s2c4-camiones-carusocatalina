object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() = 1
	method accidentado() { 0 }
}
object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	method bulto() = 1
	method accidentado() {
		peso = peso + 20
	}
}
object bumblebee {
	var property esAuto = true //base auto. Solo puede ser auto o robot

	method peso() = 800
	method nivelPeligrosidad() {
		return (
			if (esAuto) { 15 }
			else { 30 } )
	} 
	method bulto() = 2
	method accidentado() {
		esAuto = not esAuto
	}
}
object paqueteDeLadrillos {
	var property cantidad = 1

	method peso() = cantidad * 2
	method nivelPeligrosidad() = 2
	method bulto() {
		return if (cantidad < 101) { 1 }
				else if (cantidad > 300 ) { 3 }
					else { 2 }
	}
	method accidentado() {
		if (cantidad > 12) {cantidad = cantidad - 12}
		else {cantidad = 0}
	}
}
object bateriaAntiaerea {
	var property estaConMisiles = false // base descargada

	method peso() {
		return (
			if (estaConMisiles) { 300 }
			else { 200 } )
	}
	method nivelPeligrosidad() {
		return (
			if (estaConMisiles) { 100 }
			else { 0 } )
	}
	method bulto() {
		return if (estaConMisiles) {2}
				else {1}
	}
	method accidentado() {
		estaConMisiles = false
	}
}
object residuosRadiactivos {
	var property peso = 0

	method nivelPeligrosidad() = 200
	method bulto() = 1
	method accidentado() {
		peso = peso + 15
	}
}
object contenedorPortuario {
	const inventario = #{}
	method peso() {
		return 100 + inventario.sum {el => el.peso()}
	}
	method nivelPeligrosidad() {
		return try {
			inventario.max({ el => el.nivelPeligrosidad() }).nivelPeligrosidad()
		}
		catch e: Exception {
			 0
		}
	} 
	method cargar(unaCosa) {
		inventario.add(unaCosa)
	}
	method bulto() = 1 + inventario.sum {el => el.bulto()}
	method accidentado() {
		inventario.forEach {el => el.accidentado()}
	}
} 
object embalajeDeSeguridad {
	var property objEmbalado = null
	method peso() = objEmbalado.peso()
	method nivelPeligrosidad() = objEmbalado.nivelPeligrosidad() / 2
	method bulto() = 2
	method accidentado() {0}
} 

