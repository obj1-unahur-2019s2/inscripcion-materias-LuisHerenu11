class Estudiante{ 
	var property materiasCursando = []
	var property aprobaciones = []
	var carreras = []
	
	method carreraInscripto(nomDeCarrera){
		var cursando = new Carrera()
		carreras.add(cursando)
	}
	
	method materiaCursando(nomDeMateria){
		var cursando = new Materia()
		materiasCursando.add(cursando)
	}
	
	method registrarAprobacion(nomDeMateria,nota){
		if(not aprobaciones.any({aprob => aprob.materia() == nomDeMateria}) ){
			aprobaciones.add(new Aprobacion(nota = nota,materia = nomDeMateria) )}	
		else{
			(self.error("Ya esta aprobada"))
		}
	}
	
	method materiasDeLasCarrerasInscripto(){
		return carreras.flatMap({car => car.materias()})
	}
	method estaAprobado(materia){
		return aprobaciones.any({aprob => aprob.materia() == materia})
	}
	method cantidadDeMateriasAprobadas(){
		return aprobaciones.size()
	}
	method promedio(){
		return aprobaciones.sum({aprob => aprob.nota() / self.cantidadDeMateriasAprobadas()})
	}
	method puedeInscribirse(materia){
		return carreras.any({ carr => carr.materias().contains(materia)}) 
			and not self.estaAprobado(materia) and not materiasCursando.any(materia) 
			and materia.materiasRequisitos().all({ mat => mat.estaAprobado()})
	}
}

class Carrera {
	var property nombreCarrera
	var property materias = []
	
	
	method materiasDeCarrera(materia){
		materias.add(materia)
	}
}

class Materia{
	var property materia
	var property materiaRequisitos = []
	
	method requisitoDeMateria(materiaRequisito){
		materiaRequisitos.add(materiaRequisito)
	}
}

class Aprobacion{
	var property nota
	var property materia
}


/* 
object programacion{
	var property materias = [obj1, obj2, obj3 , mate1, mate2]
}
object medicina{}
object derecho{}
* 
* */