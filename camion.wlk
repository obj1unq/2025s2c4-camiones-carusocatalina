import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa))
			{ cosas.add(unaCosa) }
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa) // si no existe no pasa nada
	}
}

