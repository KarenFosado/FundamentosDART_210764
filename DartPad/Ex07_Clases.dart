void main(){
  // repado de clases en dart
  // Instanciamos la clase Hero
  print("Heroe 1: -----------------------------------------------");
  final wolverine = Hero("Logan", "Regeneración");

  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);

  final scarletWitch = Hero("Magia del caos", "wanda");
  print("Heroe 2: -----------------------------------------------");
  print(scarletWitch);
  print(scarletWitch.name);
  print(scarletWitch.power);

  final xmen = Team(type: "Heroes", name: "X-men");
  print(xmen);
  print(xmen.name);
  print(xmen.type);

  final justiceLeague = Team(name: "La liga de la justicia");
  print(justiceLeague);
  print(justiceLeague.name);
  print(justiceLeague.type);

  // Intentamos instanciar la clase con solo el valor tipo, que no lo permite por que la propiedad de nombre es requerida
  // final hydra= Team(type: "villanos");
}

class Hero
{
  String name;
  String power;

  Hero(String pName, String pPower):
  
    name = pName,
    power = pPower;
  
}

// clase con propieades no posiiconales nombradaas


class Team {
  String name;
  String type; 
  // El constructor de cla cñase siempre debe llevar el mismo npmbre
  Team({required this.name, this.type="No definido."});
}