
class Aparato {
	const property color= "Blanco"
	
	method puedeSerUsado(paciente)=true
	method necesitaMantenimiento()= false
	method consecuenciasDelUso(paciente){}
	method recibirMantenimiento(){}
}

class Magneto inherits Aparato{
	var imantacion=800
	
	method serUsado(paciente){
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1) 
	}
	
	override method consecuenciasDelUso(paciente){
		imantacion= (imantacion - 1).max(0) 
		//Asumo que la imantacion no puede ser negativa
	}
	
	override method recibirMantenimiento(){
		imantacion+=800.min(imantacion+500)
	}
}

class Bicicleta inherits Aparato{
	var cantVecesDesajusteTornillos=0
	var cantVecesPerdidaAceite=0
	
	method serUsado(paciente){
		paciente.nivelDeDolor(4)
		paciente.fortalezaMuscular(3)
	}
	
	override method puedeSerUsado(paciente){
		return paciente.edad()>8
	}
	
	override method consecuenciasDelUso(paciente){
		if(paciente.nivelDeDolor()>30){
			cantVecesDesajusteTornillos+=1
			if(paciente.edad().between(30,50)){
				cantVecesPerdidaAceite+=1 
			}
		}
	}
	
	override method necesitaMantenimiento(){
		return cantVecesDesajusteTornillos >= 10 or cantVecesPerdidaAceite >=5
	}
	
	override method recibirMantenimiento(){
		cantVecesDesajusteTornillos=0
		cantVecesPerdidaAceite=0
	}
}

class Minitramp inherits Aparato{
	method serUsado(paciente){
		paciente.fortalezaMuscular(paciente.edad()*0.1)
	}
	
	override method puedeSerUsado(paciente){
		return paciente.nivelDeDolor()<20
	}
}