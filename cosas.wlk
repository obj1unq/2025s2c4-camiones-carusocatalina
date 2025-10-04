object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}
object arenaAGranel {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
}
object bumblebee {
	var property esAuto = true //base auto. Solo puede ser auto o robot

	method peso() = 800
	method nivelPeligrosidad() {
		return (
			if (esAuto) { 15 }
			else { 30 } )
	} 
}
object paqueteDeLadrillos {
	var property cantidad = 1

	method peso() = cantidad * 2
	method nivelPeligrosidad() = 2
}
object bateriaAntiaerea {
	var estaConMisiles = false // base descargada

	method estaConMisiles(valor) { estaConMisiles = valor }
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
}
object residuosRadiactivos {
	var property peso = 0

	method nivelPeligrosidad() = 200
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
} 
object embalajeDeSeguridad {
	var property objEmbalado = null
	method peso() = objEmbalado.peso()
	method nivelPeligrosidad() = objEmbalado.nivelPeligrosidad() / 2
} 

