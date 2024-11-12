class Muralla{
    const longitud
    method valor() = longitud * 10
}
class Museo{
    const superficieCubierta
    const indiceImportancia
    method initialize(){
        if (not indiceImportancia.between(1, 5))
            self.error("indiceImportancia debe ser un numero entre 1 y 5")
    }
    method valor()= superficieCubierta * indiceImportancia
}