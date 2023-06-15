import aparatos.*

class Paciente{
	const property edad
	var fortalezaMuscular
	var nivelDeDolor
	var property rutina
	
	method puedeUsar(aparato){
		return aparato.puedeSerUsado(self)
	}
	
	method usar(aparato){
		if(not self.puedeUsar(aparato)){
			self.error("No puede usar el aparato!")
		}
		aparato.serUsado(self)
	}
	
	method fortalezaMuscular()=fortalezaMuscular
	method nivelDeDolor()=nivelDeDolor
	
	method fortalezaMuscular(unValor){fortalezaMuscular+= unValor}
	method nivelDeDolor(unValor){nivelDeDolor=0. max(nivelDeDolor - unValor)}
	
	method puedeRealizarRutina(){
		return rutina.all({ap => self.puedeUsar(ap)})
	}
	
	method realizarRutina(){
		if(self.puedeRealizarRutina()){
			rutina.forEach({ap => self.usar(ap)})
		}
	}
}

class Resistente inherits Paciente{
	override method realizarRutina(){
		super() 
		self.fortalezaMuscular(rutina.size())
	}
}

class Caprichoso inherits Paciente{
	override method puedeRealizarRutina(){
		return super() and rutina.any({ ap => ap.color()=="Rojo"})
	}
	
	override method realizarRutina(){
		2.times(super())
	}
}

class RapidaRecuperacion inherits Paciente{
	var property disminucionDolor=3
	
	override method realizarRutina(){
		super()
		self.nivelDeDolor(disminucionDolor)
	}
}







