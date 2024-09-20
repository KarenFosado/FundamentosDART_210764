void main() {
  final pokemon = {
   "Name" : "Picachu",
   "HP": 100,
   "isAlive": true,
   "abilities": ['Impact Trueno', 'cola de hierro', 'Rapido'],
   "sprites": 
    {
      1: "pikachu/front.png",
      2: "pikachu/back.png"}
 };
  
  
  final Map<String, dynamic> trainer = {
    
    "Nombre": "Ash",
    "Edad": 12,
    "Ciudad": "Pueblo paleta",
    "pokemon": pokemon,
    "IsGymnasiumLeader": false
  };
  
  
final pokemons = {
  1: "Picachu",
  2: "charmender",
  3: "squirtle",
  4: "Pidegeo"
};
  
  //
  print ("List of pokemon : $pokemons");
  
  // USE DE LA VARIABLE TRAINER
  print("Trainer's name: ${trainer['Nombre']}");
  
  // imprimit los datos de un mapa 
    print(""" Los datos actuales del mapa son: $pokemon """);
  
  
  
  
  print(""" 
  Los datos del pokemon soon usando el Mapa: 
  ------------------------------------------------------
  pokemon = $pokemon
  trainer = $trainer
  pokemons = $pokemons
  """);
  print("***********************************************************************");
  print(""" 
  Accediendo a las propiedades del pokemon usando los braquets/corchetes []
  : 
  -----------------------------------------------------------------------
  Nombre = ${pokemon['Name']}
  HP = ${pokemon ['HP']}
  Vivo = ${pokemon['isAlive']}
  Sprites = ${pokemon['sprites']}
  -------------------------------------
  """);
  
  
  // Reto 01: Obtener el valor independiente de las imagenes de front y 
  //back del pokemon
  
  // Front : ${(pokemon['sprites'])[1]}
  // Back : ${(pokemon['sprites'])[2]}
  
  // Dado que la solucon ya esta absoleta lo que quedan es crear una nueva
  // variable con el onjeto y estructurar ñlas imagenes para acceder a ellas
  
 
  final tmp_sprites = pokemon['sprites'] as Map <int, String>;
  
  print (""" Accediendo a las propiedades del pokemoon usando los braquets/corchetes []:
  ----------------------------------------------------------------------------------
  Nombre = ${pokemon["Name"]}
  HP = ${pokemon["HP"]}
  vivo = ${pokemon["isAlive"]}
  sprites = ${pokemon["sprites"]}
  ----------------------------------------------------------------------------------
  Back: ${tmp_sprites[2]}
  Front: ${tmp_sprites[1]}
 
   """);
  
 
  
}



