import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa))
			{ cosas.add(unaCosa) }
		else { self.throwsException() } 
	}

	method descargar(unaCosa) {
		if ( cosas.contains(unaCosa) )
			{ cosas.remove(unaCosa) }
		else { self.throwsException() }  // si no existe no pasa nada
	}

	method todoPesoPar() {
		cosas.
	}

	// en nivel de peligrosidad se puede reutilizar cod
	// filter y map devuelven listas 
	// map por cada elemento devuelve otro
	// 3 analisis, 1 que devuelve, 2 que va en el predicado

}

