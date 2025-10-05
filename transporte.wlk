
object caminosVecinales {
    var property pesoMaximo = 10
    method puedeCircular(obj) {
        return (not obj.excesoDePeso(pesoMaximo))
    }
}
object ruta9 {
    const limitePeligrosidad = 20
    method puedeCircular(transportador) {
        return transportador.puedeCircularEnRuta(limitePeligrosidad)
    }
}
object almacen {
    var property inventario = #{}
    method agregar(cosas) {
        inventario = inventario + cosas
    }
}