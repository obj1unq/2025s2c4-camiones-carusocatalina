import cosas.*
import transporte.*


object camion {
	const tara = 1000
	const limiteDePeso = 2500
	const property cosas = #{}
	method limiteDePeso() = limiteDePeso
		
	method cargar(unaCosa) {
		self.validarQueNoEstaCargadoCon_(unaCosa)
		cosas.add(unaCosa)
		
	}
	method validarQueNoEstaCargadoCon_(cosa) {
		if (cosas.contains(cosa))
			{ self.throwsException() } 
	}
	method descargar(unaCosa) {
		self.validarQueEstaCargadoCon_(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarQueEstaCargadoCon_(cosa) {
		if ( ! cosas.contains(cosa) )
			{ self.throwsException() } 
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
	method excesoDePeso(limite) {
		return self.pesoDeCarga() + tara > limite
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
		return (not self.excesoDePeso(limiteDePeso) && self.condicionParaCircularEnRuta(maxPeligrosidad))
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

	method enDestino(dest) {
		dest.agregar(cosas)
		cosas.removeAll(cosas)
	}
	method transportar(destino,camino) {
		self.validarCaminoParaCircular(camino)
		self.enDestino(destino)
	}

	method validarCaminoParaCircular(camino) { // agregado, es bueno usar validar
		if (! camino.puedeCircular(self))
			{self.error("no puede circular")}
	}
	// filter y map devuelven listas 
	// map por cada elemento devuelve otro
	// 3 analisis, 1 que devuelve, 2 que va en el predicado
	
}


