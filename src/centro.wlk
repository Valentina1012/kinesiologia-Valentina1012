object centro {
	const property aparatos= #{}
	const property pacientes=#{}
	
	method coloresDeAparatos(){
		return aparatos.map({ap => ap.color()}).asSet()
	}
	
	method pacientesMenoresDe8Anios(){
		return pacientes.filter({ paciente => paciente.edad() < 8})
	}
	
	method cantPacientesIncumpliendoSesion(){
		return pacientes.count({paciente => not paciente.puedeRealizarRutina()})
	}
	
	method estaEnOptimasCondiciones(){
		return aparatos.all({ap => not ap.necesitaMantenimiento()})
	}
	
	method estaComplicado(){
		return aparatos.size()/2<= aparatos.count({ap => ap.necesitaMantenimiento()})
	}
	
	method visitaDeTecnico(){
		aparatos.forEach({ap => ap.recibirMantenimiento()})
	}
}
