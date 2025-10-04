import cosas.*

object camion {
	const tara = 1000
	const limiteDePeso = 2500
	const property cosas = #{}
		
	method cargar(unaCosa) {
		if (not cosas.contains(unaCosa))
			{ cosas.add(unaCosa) }
		else { self.throwsException() } 
	}

	method descargar(unaCosa) {
		if ( cosas.contains(unaCosa) )
			{ cosas.remove(unaCosa) }
		else { self.throwsException() } 
	}

	method todoPesoPar() {
		var esPar = true
		cosas.forEach({el => esPar = esPar && el.peso().even()})
		return esPar
	}

	method algoPesa(peso_) {
		return cosas.any { el => el.peso() == peso_ }
	}
	method pesoDeCarga() {
		return cosas.sum {el => el.peso()}
	}
	method excesoDePeso() {
		return self.pesoDeCarga() + tara > limiteDePeso
	}

	method cargaConPeligrosidad(nivelPeligrosidad) {
		return cosas.find {el => el.nivelPeligrosidad() == nivelPeligrosidad }
	}

	method cosasQueSuperanNP(nivelPeligrosidad) {
		return cosas.filter { el => el.nivelPeligrosidad() > nivelPeligrosidad }
	}
	method cosasMasPeligrosasQue(unaCosa) {
		return self.cosasQueSuperanNP(unaCosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(maxPeligrosidad) {
		return (not self.excesoDePeso() && self.condicionParaCircularEnRuta(maxPeligrosidad))
	}
	method condicionParaCircularEnRuta(maxPeligrosidad) {
		return not cosas.any({ el => el.nivelPeligrosidad() >= maxPeligrosidad })
	}

	method hayAlgoQuePeseEntre(minValor, maxValor){
		return cosas.any({el => el.peso() > minValor && el.peso() < maxValor })
	}

	method cosaMasPesada() {
		return cosas.max({el => el.peso()})
	}
	method todosLosPesos() {
		return cosas.map({el => el.peso()})
	}

	method totalBultos() {
		return cosas.sum({el => el.bulto()})
	}
	method accidente() {
		cosas.forEach({el => el.accidentado()})
	}
	// filter y map devuelven listas 
	// map por cada elemento devuelve otro
	// 3 analisis, 1 que devuelve, 2 que va en el predicado

}

