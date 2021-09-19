object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	//method cantidadDeBultos(){return 1}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }

}

object paqueteDeLadrillos{
	var cantLadrillos 
	
	method setCantidadLadrillos(cantidad){cantLadrillos = cantidad}
	method peso(){return cantLadrillos * 2}
	method nivelPeligrosidad() {return 2}
}

object arenaAGranel{
	var peso
	
	method setPeso(unPeso){peso = unPeso}
	method peso(){return peso}
	method nivelPeligrosidad(){return 1}
}

object bateriaAntiaerea{
	var tieneMisiles
	
	method setTieneMisiles(estado){tieneMisiles = estado}
	method peso(){ return  if (tieneMisiles) {300} else {200}}
	method nivelPeligrosidad(){return if(tieneMisiles){100} else {0}}
}

object contenedorPortuario{
	var contenido = []
	
	method agregarContenido(unContenido){contenido.add(unContenido)}
	method peso(){
		var peso = 0
		if (contenido.size()>=1){
			peso =  100 + contenido.sum({con=>con.peso()})}
		return peso
	}
	method nivelPeligrosidad(){return contenido.max({con=>con.nivelPeligrosidad()}).nivelPeligrosidad()}
}

object residuosRadioactivos{
	var peso
	
	method setPeso(unPeso){peso = unPeso}
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
}

object embalajeDeSeguridad{
	var cosaQueEnvuelve
	
	method setCosaQueEnvuelve(unaCosa){cosaQueEnvuelve = unaCosa}
	method peso(){return cosaQueEnvuelve.peso()}
	method nivelPeligrosidad(){return cosaQueEnvuelve.nivelPeligrosidad()*0.5}
	
}
