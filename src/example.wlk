class Estudiante{ 
	var property materiasCursando = []
	var property materiasAprobadas = []
	
	method materiaCursando(nomDeMateria){
		var cursando = new Materia()
		materiasCursando.add(cursando)
	}
	method registrarAprobacion(nomDeMateria,nota){
		var aprobado = new Aprobacion()
		aprobado.nota(nota)
		aprobado.materia(nomDeMateria)
	
		materiasAprobadas.add(aprobado)	
	}
}


class Materia{
	var property materia
}

class Aprobacion{
	var property nota
	var property materia
}