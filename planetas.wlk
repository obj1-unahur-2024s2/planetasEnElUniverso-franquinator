class Planeta{
    const property habitantes = []
    const property construcciones = []
    method agregarHabitante(unHabitante){
        unHabitante.cambiarDePlaneta(self)
        habitantes.add(unHabitante)
    }
    method eliminatHabitante(unHabitante){
        unHabitante.cambiarDePlaneta(null)
        habitantes.remove(unHabitante)
    }
    method agregarconstruccion(unaConstruccion){construcciones.add(unaConstruccion)}
    method eliminatconstruccion(unaConstruccion){construcciones.remove(unaConstruccion)}
    method delegacionDiplomatica() = habitantes.filter({p => p.esDestacada()})
    method esValioso() = construcciones.sum({c=>c.valor()})
    method trabajar(cantTiempo,unPlaneta){
        self.delegacionDiplomatica().forEach({delegado => delegado.trabajarEnPlaneta(cantTiempo, unPlaneta)})
    }
    method invadir(cantHoras,unPlaneta){
        unPlaneta.trabajar(cantHoras, self)
    }
}