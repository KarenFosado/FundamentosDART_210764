void main() {
  // Ejemplo de clases en Dart
  // Creamos una instancia de la clase Hero
  final wolverine = Hero("Logan", "Regeneración");
  
  print("-----------------------------------------------------");
  print("Héroe");
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
  print("-----------------------------------------------------");
  
  final magneto = Hero("Erick", "Campos Magnéticos");
  print("Anti-Héroe");
  print(magneto);
  print(magneto.name);
  print(magneto.power);
  print("-----------------------------------------------------");
  
  final xmen = Team(type: "Héroes", name: "X-Men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);
  print("-----------------------------------------------------");
  
  final JL = Team(name: "La Liga de la Justicia");
  print(JL);
  print(JL.name);
  print(JL.type);
  print("-----------------------------------------------------");
  
  /* Intentamos crear una instancia de la clase Team solo con el tipo, pero no es posible ya que 'name' es obligatorio */
  // final hydra = Team(type: "Villanos");
}

// Clase con propiedades posicionales
class Hero {
  String name;
  String power;
  
  // Inicialización del constructor
  Hero(String pName, String pPower)
      : name = pName,
        power = pPower;
}

// Clase con propiedades nombradas
class Team {
  String name;
  String type;
  
  // Constructor con parámetros nombrados, 'name' es obligatorio, 'type' tiene un valor por defecto
  Team({required this.name, this.type = "No definido"});
  
  @override
  String toString() {
    return 'Grupo: $name, Tipo: $type';
  }
}
