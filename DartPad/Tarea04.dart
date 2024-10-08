

// 1. Definición de la clase abstracta <Persona>
abstract class Persona {
  int personaID;
  String? nombre;
  DateTime fechaNacimiento;
  String? genero;

  Persona({
    required this.personaID,
    this.nombre,
    required this.fechaNacimiento,
    this.genero,
  });

  // 2. Definición de la función de la clase
  void mostrarInformacion() {
    print('ID Persona: $personaID');
    print('Nombre: ${nombre ?? 'Desconocido'}');
    print('Fecha de Nacimiento: $fechaNacimiento');
    print('Género: ${genero ?? 'No especificado'}');
  }
}

// 3. Declaración de las propiedades de la clase <Paciente>
// Clase que extiende de Persona
class Paciente extends Persona {
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

  // 6. Sobreescritura de la función registrarDefuncion()
  // Método para registrar la defunción
  void registrarDefuncion() {
    estatusVida = 'Finado';
    estatus = false;
    fechaActualizacion = DateTime.now();
    print('El paciente ha sido registrado como fallecido.');
  }

  // 4. Sobreescritura de las propiedades de la clase abstracta <Persona>
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

// 7. Métodos CRUD de la clase

// 8. Uso de Extends / Implements

void main() {
  // Caso 1: Paciente nuevo que se registra hoy
  Paciente pacienteNuevo = Paciente(
    personaID: 256,
    nombre: 'Juan Perez Rodriguez',
    fechaNacimiento: DateTime(1992, 8, 5),
    genero: 'Masculino',
    NSS: 'ANSISISNN12233',
    tipoSeguro: 'IMSS',
    estatusMedico: 'Activo',
    estatusVida: 'Vivo',
    estatus: true,
    fechaRegistro: DateTime.now(),
  );

  // 9. Caso de prueba 1: Paciente nuevo
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

  // 10. Caso de prueba 2: Paciente ya registrado
  print('\nCaso 2: Paciente ya registrado');
  pacienteExistente.mostrarInformacion();

  // Caso 3: Paciente que fallece
  print('\nCaso 3: Paciente fallecido');
  pacienteNuevo.registrarDefuncion();

  // 11. Caso de prueba 3: Paciente fallecido
  pacienteNuevo.mostrarInformacion();
}
