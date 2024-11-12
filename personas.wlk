import construcciones.*
class Persona{
    var planetaEnQueVive = null
    method cambiarDePlaneta(unPlaneta){
        planetaEnQueVive = unPlaneta
    }
    var monedas = 20
    method recursos() = monedas
    var edad
    method esDestacada() = edad.between(18, 65) and self.recursos() > 30
    method ganarMonedas(unaCantidad){
        monedas += unaCantidad
    }
    method gastarMonedas(unaCantidad){
        monedas = 0.max(monedas - unaCantidad)
    }
    method cumplirAnios(){
        edad += 1
    }
    method trabajarEnPlaneta(cantTiempo,unPlaneta){}
}
class Productor inherits Persona{
    const property tecnicas = ["cultivo"]
    override method recursos() = monedas * tecnicas.size() 
    override method esDestacada() = super() or tecnicas.size() > 5
    method realizarTecnica(unaTecnica,cantTiempo){
        if(self.conoceLaTecnica(unaTecnica) )
            self.ganarMonedas(3 * cantTiempo)
        else
            self.gastarMonedas(1)
    }
    method conoceLaTecnica(unaTecnica) = tecnicas.contains(unaTecnica)
    method aprenderTecnica(unaTecnica){tecnicas.add(unaTecnica)}
    override method trabajarEnPlaneta(cantTiempo,unPlaneta){
        if(unPlaneta == planetaEnQueVive)
            self.realizarTecnica(tecnicas.last(), cantTiempo)
    }
}
class Constructor inherits Persona{
    var cantConstruccionesRealiz
    const property inteligencia
    const region
    override method recursos() = monedas + 10 * cantConstruccionesRealiz
    override method esDestacada() = cantConstruccionesRealiz > 5
    override method trabajarEnPlaneta(cantTiempo,unPlaneta){
        self.gastarMonedas(5)
        cantConstruccionesRealiz += 1
        unPlaneta.agregarconstruccion(region.estructura(cantTiempo,self.esDestacada()))
    }
}
object regionMontania {
    method estructura(horasTrabajadas,trabajador) = new Muralla(longitud = horasTrabajadas / 2)
}
object regionCosta{
    method estructura(horasTrabajadas,trabajador) = new Museo(superficieCubierta = horasTrabajadas, indiceImportancia = 1)
}
object regionLlanura {
    method estructura(horasTrabajadas,trabajador) = 
        if(!trabajador.esDestacado()) 
            new Muralla(longitud = horasTrabajadas/2) 
        else  
            new Museo(superficieCubierta = horasTrabajadas,indiceImportancia = 0.max(5.min(trabajador.recursos())))
}
object regionArtica{
    method estructura(horasTrabajadas,trabajador) =
        if(trabajador.inteligencia() > 10)
            new Museo(superficieCubierta = horasTrabajadas*2,indiceImportancia = 5)
        else  
            new Museo(superficieCubierta = horasTrabajadas/2,indiceImportancia = 1)
}