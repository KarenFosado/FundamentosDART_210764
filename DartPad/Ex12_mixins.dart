abstract class Animal {}

abstract class Mamifero extends Animal {}
abstract class Ave extends Animal {}
abstract class Pez extends Animal {}


mixin volador{
  void volar() => print('estoy volando!');
}
mixin Caminante{
  void caminar() => print('estoy caminando!');
}
mixin Nadador{
  void nadar() => print('estoy nadando!');
}


class Delfin extends Mamifero with Nadador {}
class Murcielago extends Mamifero with volador, Caminante {}
class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, volador {}
class Pato extends Ave with Caminante, volador, Nadador {}


class Tiburon extends Pez with Nadador {}
class PezVolador extends Pez with Nadador, volador {}


void main(){
  final flipper = Delfin();
  print("Instanciado la clase delfin, y accediendo a sus funciones.");
  flipper.nadar();

  
  print("----------------------------------------------------------------------");
  print("Instanciado la clase de murcielago, y accediendo a sus funciones.");
  final chupacabras = Murcielago();
  chupacabras.caminar();
  chupacabras.volar();

  
  print("----------------------------------------------------------------------");
  print("Instanciado la clase de Pato, y accediendo a sus funciones.");
  final donal = Pato();
  donal.caminar();
  donal.volar();
  donal.nadar();
}