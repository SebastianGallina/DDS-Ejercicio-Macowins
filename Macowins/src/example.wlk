class Prenda{
	const property identificador
	const property estado
	const property precio
		
	method precioVenta() = estado.cualEsElPrecio(precio)

}

class Saco inherits Prenda{

}
class Pantalon inherits Prenda{

}
class Camisa inherits Prenda{

}

object nueva {
	method cualEsElPrecio(precio) = precio	
}
object promocion {
	var property descuentoFijo //aca me encuentro con el problema de que no se como preguntarle al usuario el precio que quiere
	//ya que la consigina dice que se puede hacer por pseudocodigo me voy a tomar la libertad de suponer que 
	//el usuario puede modificar la variable descuentoFijo.
	method cualEsElPrecio(precio) = precio - descuentoFijo
}
object liquidacion {
	const property descuentoPorcentual = 0.5
	method cualEsElPrecio(precio) = precio*descuentoPorcentual
}

class Venta{
	const property identificador
	const property listaDePrendas = []  
	const property fecha = new date()
	const property ventaConTarjeta
	const property cantCuotas
	const property coeficienteFijo
	
	method agregarPrenda(prenda) {
		listaDePrendas.add(prenda)
	}
	method cantidad() = listaDePrendas.length()
	method sumaPrecios() =  listaDePrendas.sum({ prenda => prenda.precioVenta()})
	method precioTotal() =  if (ventaConTarjeta) self.precioConTarjeta() else self.sumaPrecios()
	method precioConTarjeta() = self.sumaPrecios() + self.recargo()
	method recargo() = cantCuotas * coeficienteFijo + listaDePrendas.map({ prenda => prenda.precioVenta() * 0.01}.sum({ prenda => prenda.precioVenta()}))
	
}

object log {
	
 const property ventas = []

	method agregarVenta(venta){
		ventas.add(venta)
	}
	
	method gananciasElDia(elDia) = self.ventasElDia(elDia).sum({ venta => venta.precioTotal()})
	method ventasElDia(elDia) = ventas.filter{venta => venta.fecha()== elDia}
	
}

