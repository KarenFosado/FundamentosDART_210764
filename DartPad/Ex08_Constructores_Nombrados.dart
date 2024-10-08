void main() {
  // Caso 1: Paciente nuevo registrado el día de hoy
  final paciente1 = Paciente(
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
    nss: "123456789012345",
    tipoSeguro: "IMSS",
    estatusMedico: "Estable",
    estatusVida: "Vivo",
    fechaUltimaCita: DateTime(2024, 10, 05),
    // El registro de paciente es ahora mismo.
    fechaRegistroPaciente: DateTime.now(),
  );

  print(paciente1);

  // Caso 2: Paciente que fue trabajador registrado como paciente
  final paciente2 = Paciente(
    ID: 125,
    name: "Martha",
    firstLastname: "Flores",
    gender: "Mujer",
    bloodGroup: "O-",
    birthdate: DateTime(2008, 01, 08),
    nss: "987654321098765",
    tipoSeguro: "ISSSTE",
    estatusMedico: "Revisiones constantes",
    estatusVida: "Vivo",
    fechaUltimaCita: DateTime(2024, 09, 10),
    // Este paciente fue registrado originalmente en esta fecha (como trabajador).
    createdAt: DateTime(2020, 05, 12, 09, 00, 00),
    // Ahora lo registramos como paciente.
    fechaRegistroPaciente: DateTime.now(),
  );

  print(paciente2);

  // Caso 3: Paciente que acaba de fallecer
  final paciente3 = Paciente(
    ID: 300,
    name: "Pedro",
    firstLastname: "López",
    gender: "Hombre",
    bloodGroup: "A+",
    birthdate: DateTime(1975, 04, 12),
    nss: "321654987321654",
    tipoSeguro: "Seguro Popular",
    estatusMedico: "Crítico",
    estatusVida: "Finado", // Cambiado a "Finado"
    fechaUltimaCita: DateTime(2024, 07, 12),
    isActive: false, // Cambiado a inactivo
    createdAt: DateTime(2024, 07, 12, 10, 30, 00),
    // Proporcionamos el valor de 'fechaRegistroPaciente'
    fechaRegistroPaciente: DateTime.now(), // O la fecha que sea apropiada
  );


  print(paciente3);
}

// Clase Paciente que hereda de Person
class Paciente extends Person {
  String nss;
  String tipoSeguro;
  String estatusMedico;
  String estatusVida;
  DateTime fechaUltimaCita;
  DateTime fechaRegistroPaciente; // Nueva propiedad para el registro como paciente

  Paciente({
    required int ID,
    String? cortesyTitle,
    required String name,
    required String firstLastname,
    String? secondLastname,
    required String gender,
    required String bloodGroup,
    String? photoURL,
    String? curp,
    required DateTime birthdate,
    bool isActive = true,
    DateTime? createdAt,
    DateTime? updatedAt,
    required this.nss,
    required this.tipoSeguro,
    required this.estatusMedico,
    required this.estatusVida,
    required this.fechaUltimaCita,
    required this.fechaRegistroPaciente, // Añadimos el parámetro aquí
  }) : super(
          ID: ID,
          cortesyTitle: cortesyTitle,
          name: name,
          firstLastname: firstLastname,
          secondLastname: secondLastname,
          gender: gender,
          bloodGroup: bloodGroup,
          photoURL: photoURL,
          curp: curp,
          birthdate: birthdate,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

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

    final String formattedUltimaCita =
        "${fechaUltimaCita.day.toString().padLeft(2, '0')}/"
        "${fechaUltimaCita.month.toString().padLeft(2, '0')}/${fechaUltimaCita.year}";

    final String formattedFechaRegistroPaciente =
        "${fechaRegistroPaciente.day.toString().padLeft(2, '0')}/"
        "${fechaRegistroPaciente.month.toString().padLeft(2, '0')}/${fechaRegistroPaciente.year} "
        "${fechaRegistroPaciente.hour.toString().padLeft(2, '0')}:" 
        "${fechaRegistroPaciente.minute.toString().padLeft(2, '0')}:" 
        "${fechaRegistroPaciente.second.toString().padLeft(2, '0')}";

    curp ??= "No registrado";
    if (curp == "") curp = "No registrado";

    String status = isActive ? "Activo" : "Inactivo";

    return """
   ----------------------------------------------------------
   INFORMACIÓN PERSONAL
   ----------------------------------------------------------
   ID: $ID
   Nombre: ${name + ' ' + firstLastname + (secondLastname != null ? ' ' + secondLastname! : '')}
   Género: $gender
   Grupo Sanguíneo: $bloodGroup
   Fecha de Nacimiento: $formattedBirthDate
   Foto: ${photoURL ?? 'No disponible'}
   CURP: $curp
   Estatus: $status
   Fecha de Registro (Original): $formattedCreatedDate
   Fecha de Registro como Paciente: $formattedFechaRegistroPaciente
   ----------------------------------------------------------
   INFORMACIÓN PACIENTE
   ----------------------------------------------------------
   NSS: $nss
   Tipo de Seguro: $tipoSeguro
   Estatus Médico: $estatusMedico
   Estatus Vida: $estatusVida
   Fecha de Última Cita: $formattedUltimaCita
   ----------------------------------------------------------
   """;
  }
}

// Clase base Person
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
}
