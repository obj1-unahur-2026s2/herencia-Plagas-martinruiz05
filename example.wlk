class Elementos {
  method esBueno(){

  }
  method sufrirEfectos(plaga){

  }
}

class Hogar inherits Elementos {
  const nivelDeMugre
  const nivelDeConfort
  override method esBueno(){
    return nivelDeMugre <= nivelDeConfort /2
  }
  override method sufrirEfectos(plaga){
    nivelDeMugre + plaga.nivelDeDaño()

  }
}


class Huerta inherits Elementos {
  const capacidadDeProduccion
  var nivelMinimoDeProduccion = 100
  override method esBueno(){
    return capacidadDeProduccion > nivelMinimoDeProduccion
  }
  override method sufrirEfectos(plaga){
    if(plaga.puedeTransmitirEnfermedad()){
      (capacidadDeProduccion) - (plaga.nivelDeDaño() / 0.1) + 10 
    }
    else{
      (capacidadDeProduccion) - (plaga.nivelDeDaño() / 0.1)

    }
    
  }

}

class Mascota inherits Elementos {
  const nivelDeSalud
  override method esBueno(){
    return nivelDeSalud > 250
  }
  override method sufrirEfectos(plaga){
    if(plaga.puedeTransmitirEnfermedad()){
      nivelDeSalud - plaga.nivelDeDaño()
    }
  }
}

class Barrio {
  const elementosDelBarrio = [] 
  method addElementos(elemento){
    elementosDelBarrio.add(elemento)
  }
  method elementosBuenos(){
   return elementosDelBarrio.filter({e=>e.esBueno()})
  }
  method elementosMalos(){
    return elementosDelBarrio.filter({ e => not e.esBueno() })
  }
  method esCopado(){
    return self.elementosMalos().size() < self.elementosBuenos().size()
  }
}

class Plagas {
  var poblacion
  method puedeTransmitirEnfermedad(){
    return poblacion >= 10
  }
   method ataqueAElemento(elemento){
    self.aumentarPoblacion()
    elemento.sufrirEfectos(self)
  }
  method aumentarPoblacion(){
    poblacion = poblacion * 1.1
  }

}

class Cucarachas inherits Plagas {
  const pesoPromedio
  method nivelDeDaño(){
    return poblacion / 2
  }
  override method puedeTransmitirEnfermedad(){
   return super() and pesoPromedio >= 10

  }
  override method aumentarPoblacion(){
    super()
    pesoPromedio + 2
  }
}

class Pulgas inherits Plagas{
  method nivelDeDaño(){
    return poblacion *2
  }

}

class Garrapatas inherits Pulgas{
 override method aumentarPoblacion(){
  poblacion = poblacion * 2.2
 }



}

class Mosquitos inherits Plagas {
  method nivelDeDaño(){
    return poblacion
  }
  override method puedeTransmitirEnfermedad(){
    return super() and poblacion % 3 == 0
  }
 
}