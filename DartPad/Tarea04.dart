import 'dart:io';

abstract class Person {
  int personaID;
  String? nombre;
  DateTime fechaNacimiento;
  String? genero;
  
  Person({
    required this.personaID,
    this.nombre,
    required this.fechaNacimiento,
    this.genero,
  });

  void mostrarInformacion() {
    print('ID Persona: $personaID');
    print('Nombre: ${nombre ?? 'Desconocido'}');
    print('Fecha de Nacimiento: $fechaNacimiento');
    print('Género: ${genero ?? 'No especificado'}');
  }
}

// Clase que extiende de Person
class Paciente extends Person {
  String? NSS;
  String? tipoSeguro;
  DateTime? fechaUltimaCita;
  String? estatusMedico;
  String estatusVida; // Enum en el modelo SQL
  bool estatus; // Estatus activo/inactivo
  DateTime fechaRegistro;
  DateTime? fechaActualizacion;

  Paciente({
    required int personaID,
    String? nombre,
    required DateTime fechaNacimiento,
    String? genero,
    this.NSS,
    this.tipoSeguro,
    this.fechaUltimaCita,
    this.estatusMedico,
    required this.estatusVida,
    required this.estatus,
    required this.fechaRegistro,
    this.fechaActualizacion,
  }) : super(
          personaID: personaID,
          nombre: nombre,
          fechaNacimiento: fechaNacimiento,
          genero: genero,
        );

  // Método para registrar la defunción
  void registrarDefuncion() {
    estatusVida = 'Finado';
    estatus = false;
    fechaActualizacion = DateTime.now();
    print('El paciente ha sido registrado como fallecido.');
  }

  @override
  void mostrarInformacion() {
    super.mostrarInformacion();
    print('NSS: ${NSS ?? 'No registrado'}');
    print('Tipo de Seguro: ${tipoSeguro ?? 'No especificado'}');
    print('Fecha Última Cita: ${fechaUltimaCita ?? 'No disponible'}');
    print('Estatus Médico: ${estatusMedico ?? 'No disponible'}');
    print('Estatus Vida: $estatusVida');
    print('Activo: ${estatus ? 'Sí' : 'No'}');
    print('Fecha de Registro: $fechaRegistro');
    print('Fecha de Actualización: ${fechaActualizacion ?? 'No disponible'}');
  }
}

void main() {
  // Caso 1: Paciente nuevo que se registra hoy
  Paciente pacienteNuevo = Paciente(
    personaID: 256,
    nombre: 'Juan Perez Rodriguez',
    fechaNacimiento: DateTime(1992, 8, 5),
    genero: 'Male',
    NSS: 'ANSISISNN12233',
    tipoSeguro: 'IMSS',
    estatusMedico: 'Activo',
    estatusVida: 'Vivo',
    estatus: true,
    fechaRegistro: DateTime.now(),
  );

  print('Caso 1: Paciente nuevo');
  pacienteNuevo.mostrarInformacion();

  // Caso 2: Paciente que ya estaba registrado
  Paciente pacienteExistente = Paciente(
    personaID: 125,
    nombre: 'Martha Flores',
    fechaNacimiento: DateTime(2008, 1, 8),
    genero: 'Femenino',
    NSS: 'IMSS1234567890',
    tipoSeguro: 'IMSS',
    fechaUltimaCita: DateTime(2023, 10, 5),
    estatusMedico: 'Control',
    estatusVida: 'Vivo',
    estatus: true,
    fechaRegistro: DateTime(2020, 9, 12),
    fechaActualizacion: DateTime(2024, 1, 5),
  );

  print('\nCaso 2: Paciente ya registrado');
  pacienteExistente.mostrarInformacion();

  // Caso 3: Paciente que fallece
  print('\nCaso 3: Paciente fallecido');
  pacienteNuevo.registrarDefuncion();
  pacienteNuevo.mostrarInformacion();
}
