import cosas2.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	
	method todoPesoPar(){
		return cosas.all{c=> c.peso()%2 == 0}
	}
	
	method hayAlgunoQuePesa(peso){
		return cosas.any{c=> c.peso() == peso}
	}
	
	method elDeNivel(nivel){
		return cosas.find{c=>c.nivelPeligrosidad() == nivel}
	}
	
	method peso(){return 1000}
	
	method pesoTotal(){ return self.peso()+ cosas.sum({c=>c.peso()})}
	
	method excedidoDePeso(){return self.pesoTotal() > 2500}
	
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({c=>c.nivelPeligrosidad()>nivel})
	}
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({c=>c.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not self.excedidoDePeso() and 
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).size() ==0
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.count({c=>c.peso().between(min,max)})>0
	}
	
	method cosaMasPesada(){
		return cosas.max({c=>c.peso()})
	}
	
	method pesos(){
		return cosas.map({c=>c.peso()})
	}
	
	//method totalBultos(){
	//	return cosas.sum({c=>c.cantidadDeBultos()})
	//}
}
