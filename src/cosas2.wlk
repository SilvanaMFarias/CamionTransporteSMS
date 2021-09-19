object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantidadDeBultos(){return 1}
	method consecuenciaDeLaCarga(){}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method cantidadDeBultos(){return 2}
	method consecuenciaDeLaCarga(){transformadoEnAuto = false}

}

object paqueteDeLadrillos{
	var cantLadrillos 
	
	method setCantidadLadrillos(cantidad){cantLadrillos = cantidad}
	method peso(){return cantLadrillos * 2}
	method nivelPeligrosidad() {return 2}
	method cantidadDeBultos(){
		var cantBultos=0
		if (cantLadrillos.between(1,100)){
			cantBultos =1
		}
		else if (cantLadrillos.between(101,300)){
			cantBultos =2
		}
		else{cantBultos = 3}
	}
	method consecuenciaDeLaCarga(){cantLadrillos +=12}
}

object arenaAGranel{
	var peso
	
	method setPeso(unPeso){peso = unPeso}
	method peso(){return peso}
	method nivelPeligrosidad(){return 1}
	method cantidadDeBultos(){return 1}
	method consecuenciaDeLaCarga(){peso +=20}
}

object bateriaAntiaerea{
	var tieneMisiles
	
	method setTieneMisiles(estado){tieneMisiles = estado}
	method peso(){ return  if (tieneMisiles) {300} else {200}}
	method nivelPeligrosidad(){return if(tieneMisiles){100} else {0}}
	method cantidadDeBultos(){ return  if (tieneMisiles) {2} else {1}}
	method consecuenciaDeLaCarga(){tieneMisiles= true}
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
	method cantidadDeBultos(){return (contenido.sum({con=>con.cantidadDeBultos()})+1)}
	method consecuenciaDeLaCarga(){contenido.forEach({con=>con.consecuenciaDeLaCarga()})}
}


object residuosRadioactivos{
	var peso
	
	method setPeso(unPeso){peso = unPeso}
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
	method cantidadDeBultos(){return 1}
	method consecuenciaDeLaCarga(){peso +=15}
}

object embalajeDeSeguridad{
	var cosaQueEnvuelve
	
	method setCosaQueEnvuelve(unaCosa){cosaQueEnvuelve = unaCosa}
	method peso(){return cosaQueEnvuelve.peso()}
	method nivelPeligrosidad(){return cosaQueEnvuelve.nivelPeligrosidad()*0.5}
	method cantidadDeBultos(){return 2}
	method consecuenciaDeLaCarga(){}
}
