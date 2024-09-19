void main() {
  // PRACTICA 04: tIPOS DE DATOS EN DART

  // Cadenas (String)
  final String pokemon = 'Ditto';

  // Enteros (Int)
  final int hp = 100;

  // Boleano (Bolean)
  final bool isAlive = true;

  final abilities = ['Impact-True', "Cola de Hierro", "Atacaque Rápido"];

  final sprites = <String>['ditto/front.png, ', 'dito/back.png'];

  print(""" El pokemon que elegiste es: $pokemon
  ---------------------------------------------------
  Las estadisticas de $pokemon son:
  Vida (Hp) : $hp 
  Estatus de visa: $isAlive
  Habilidades: $abilities
  Imágenes: $sprites
       """);
}
