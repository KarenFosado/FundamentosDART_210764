void main() {
  // Pruebas con constructores nombrados

  // Prueba 1: Todos los datos proporcionados
  final karenFosado = Person(
    ID: 250,
    cortesyTitle: "Sra.",
    name: "Karen Alyn",
    firstLastname: "Fosado",
    secondLastname: "Rodríguez",
    gender: "Mujer",
    bloodGroup: "O+",
    curp: "FORK0303418MPLSDRA7",
    birthdate: DateTime(2003, 05, 18),
    isActive: true,
    createdAt: DateTime(2024, 09, 20, 11, 05, 16),
  );

  print(karenFosado);

  // Prueba 2: Solo datos obligatorios
  final marthaFlores = Person(
    ID: 125,
    name: "Martha",
    firstLastname: "Flores",
    gender: "Mujer",
    bloodGroup: "O-",
    birthdate: DateTime(2008, 01, 08),
  );

  print(marthaFlores);
}

class Person {
  int ID;
  String? cortesyTitle;
  String name;
  String firstLastname;
  String? secondLastname;
  String gender;
  String bloodGroup;
  String? photoURL;
  String? curp;
  DateTime birthdate;
  bool isActive;
  DateTime createdAt;
  DateTime? updatedAt;

  Person({
    required this.ID,
    this.cortesyTitle,
    required this.name,
    required this.firstLastname,
    this.secondLastname,
    required this.gender,
    required this.bloodGroup,
    this.photoURL,
    this.curp,
    required this.birthdate,
    this.isActive = true,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  String toString() {
    final String formattedBirthDate =
        "${birthdate.day.toString().padLeft(2, '0')}/"
        "${birthdate.month.toString().padLeft(2, '0')}/${birthdate.year}";

    final String formattedCreatedDate =
        "${createdAt.day.toString().padLeft(2, '0')}/"
        "${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year} "
        "${createdAt.hour.toString().padLeft(2, '0')}:"
        "${createdAt.minute.toString().padLeft(2, '0')}:"
        "${createdAt.second.toString().padLeft(2, '0')}";

    curp ??= "No registrado";
    if (curp == "") curp = "No registrado";

    String status = isActive ? "Activo" : "Inactivo";

    return """
   ----------------------------------------------------------
   INFORMACIÓN PERSONAL
   ----------------------------------------------------------
   ID: $ID,
   Nombre: $name $firstLastname ${secondLastname ?? ''}
   Género: $gender
   Grupo Sanguíneo: $bloodGroup
   Fecha de Nacimiento: $formattedBirthDate
   Foto: ${photoURL ?? 'No disponible'}
   CURP: $curp
   Estatus: $status
   Fecha de Registro: $formattedCreatedDate
   ----------------------------------------------------------
   """;
  }
}
