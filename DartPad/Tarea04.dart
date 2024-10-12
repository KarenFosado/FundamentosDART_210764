// 1. Definición de la clase abstracta <Persona>
abstract class Persona {
  int personaID;  // ID único para identificar a cada persona (NOT NULL, AUTO_INCREMENT).
  String? titulo;  // Título opcional (Sr., Sra., Dr., etc.) (DEFAULT NULL).
  String nombre;  // Nombre de la persona (NOT NULL).
  String primerApellido;  // Primer apellido de la persona (NOT NULL).
  String? segundoApellido;  // Segundo apellido opcional (DEFAULT NULL).
  String? curp;  // CURP opcional y único (UNIQUE, DEFAULT NULL).
  String grupoSanguineo;  // Grupo sanguíneo de la persona (NOT NULL).
  DateTime fechaNacimiento;  // Fecha de nacimiento de la persona (NOT NULL).
  String genero;  // Género de la persona (NOT NULL).
  DateTime fechaRegistroPersona;  // Fecha de registro de la persona.
  bool estatus;  // Indica si el paciente está activo o no (DEFAULT TRUE).

  // 2. Constructor que inicializa los atributos de la clase abstracta Persona.
  Persona({
    required this.personaID,  // ID obligatorio.
    this.titulo,  // Título opcional.
    required this.nombre,  // Nombre obligatorio.
    required this.primerApellido,  // Primer apellido obligatorio.
    this.segundoApellido,  // Segundo apellido opcional.
    this.curp,  // CURP opcional.
    required this.grupoSanguineo,  // Grupo sanguíneo obligatorio.
    required this.fechaNacimiento,  // Fecha de nacimiento obligatoria.
    required this.genero,  // Género obligatorio.
    required this.fechaRegistroPersona,  // Fecha de registro obligatoria.
    required this.estatus,
  });

  // 3. Método para mostrar la información de la persona.
  void mostrarInformacion() {
    print('================== PERSONA ==================');
    print('ID Persona: $personaID');
    print('Título: ${titulo ?? 'No especificado'}');
    print('Nombre completo: $nombre $primerApellido ${segundoApellido ?? ''}'.trim());
    print('CURP: ${curp ?? 'No registrado'}');
    print('Grupo Sanguíneo: $grupoSanguineo');
    print('Fecha de Nacimiento: $fechaNacimiento');
    print('Fecha de Registro como Persona: $fechaRegistroPersona');
    print('Género: $genero');
    print('Estatus: ${estatus ? 'Activo' : 'Desactivado'}');
  }
}

// 4. Declaración de la clase <Paciente> que extiende de Persona.
class Paciente extends Persona {
  String? nss;  // Número de seguridad social opcional (DEFAULT NULL, UNIQUE).
  String tipoSeguro;  // Tipo de seguro médico (NOT NULL).
  DateTime? fechaUltimaCita;  // Fecha de la última cita médica opcional (DEFAULT NULL).
  String estatusMedico;  // Estado médico del paciente (DEFAULT 'Normal').
  String estatusVida;  // Estado de vida del paciente (DEFAULT 'Vivo').
  bool estatus;  // Indica si el paciente está activo o no (DEFAULT TRUE).
  DateTime fechaRegistroPaciente;  // Fecha de registro del paciente (NOT NULL, DEFAULT CURRENT_TIMESTAMP).
  DateTime? fechaActualizacion;  // Fecha de la última actualización (DEFAULT NULL).

  // 5. Constructor que inicializa las propiedades del paciente y las de la clase Persona.
  Paciente({
    required int personaID,
    String? titulo,
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    String? curp,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    required DateTime fechaRegistroPersona,
    required String genero,
    this.nss,  // Opcional.
    required this.tipoSeguro,  // Tipo de seguro obligatorio.
    this.fechaUltimaCita,  // Opcional.
    this.estatusMedico = 'Control',  // Valor por defecto: 'Activo'.
    this.estatusVida = 'Vivo',  // Valor por defecto: 'Vivo'.
    this.estatus = true,  // Valor por defecto: activo (true).
    required this.fechaRegistroPaciente,  // Fecha de alta obligatoria.
    this.fechaActualizacion,  // Opcional.
  }) : super(
          personaID: personaID,
          titulo: titulo,
          nombre: nombre,
          primerApellido: primerApellido,
          segundoApellido: segundoApellido,
          curp: curp,
          grupoSanguineo: grupoSanguineo,
          fechaNacimiento: fechaNacimiento,
          fechaRegistroPersona: fechaRegistroPersona,
          genero: genero,
          estatus: estatus,
        );

  // 6. Sobrescribir el método mostrarInformacion() de Persona para mostrar detalles adicionales.
  @override
  void mostrarInformacion() {
    super.mostrarInformacion();
    print('================== PACIENTE ==================');
    if (nss != null) print('NSS: $nss');
    print('Tipo de Seguro: $tipoSeguro');
    if (fechaUltimaCita != null) print('Fecha Última Cita: $fechaUltimaCita');
    print('Estatus Médico: $estatusMedico');
    print('Estatus Vida: $estatusVida');
    print('Estatus: ${estatus ? 'Activo' : 'Desactivado'}');
    print('Fecha de Registro como Paciente: $fechaRegistroPaciente');
    if (fechaActualizacion != null) print('Fecha de Actualización: $fechaActualizacion');
  }

  // 7. Método para registrar la defunción del paciente.
  void registrarDefuncion() {
    estatusVida = 'Finado';
    estatus = false; // Cambia a desactivado.
    fechaActualizacion = DateTime.now();
    print('El paciente ha sido registrado como fallecido.');
  }

  // 8. Métodos CRUD de la Clase <Paciente, Persona> 
  static Paciente crearPaciente({
    required int personaID,
    String? titulo,
    required String nombre,
    required String primerApellido,
    String? segundoApellido,
    String? curp,
    required String grupoSanguineo,
    required DateTime fechaNacimiento,
    required String genero,
    String? nss,
    required String tipoSeguro,
    String estatusVida = 'Vivo',
    bool estatus = true,
    required DateTime fechaRegistroPaciente,
    required DateTime fechaUltimaCita,
    required DateTime fechaRegistroPersona,
  }) {
    return Paciente(
      personaID: personaID,
      titulo: titulo,
      nombre: nombre,
      primerApellido: primerApellido,
      segundoApellido: segundoApellido,
      curp: curp,
      grupoSanguineo: grupoSanguineo,
      fechaNacimiento: fechaNacimiento,
      fechaUltimaCita: fechaUltimaCita,
      genero: genero,
      nss: nss,
      tipoSeguro: tipoSeguro,
      estatusVida: estatusVida,
      estatus: estatus,
      fechaRegistroPaciente: fechaRegistroPaciente,
      fechaRegistroPersona: fechaRegistroPersona,
    );
  }

  // 9. Métodos para leer, actualizar y eliminar la información del paciente.
  void leerPaciente() {
    mostrarInformacion();
  }

  void actualizarPaciente({
    String? nuevoNombre,
    String? nuevoNss,
    String? nuevoTipoSeguro,
    String? nuevoEstatusMedico,
    bool? nuevoEstatus,
  }) {
    if (nuevoNombre != null) nombre = nuevoNombre;
    if (nuevoNss != null) nss = nuevoNss;
    if (nuevoTipoSeguro != null) tipoSeguro = nuevoTipoSeguro;
    if (nuevoEstatusMedico != null) estatusMedico = nuevoEstatusMedico;
    if (nuevoEstatus != null) estatus = nuevoEstatus;
    fechaActualizacion = DateTime.now();
    print('\n*********** La información del paciente ha sido actualizada.*********');
  }

  void eliminarPaciente() {
    estatus = false;
    print('El paciente ha sido eliminado (estatus inactivo).');
  }
}

// 10. Casos de prueba en la función main.
void main() {
  // Caso de prueba 1: Paciente nuevo.
  Paciente pacienteNuevo = Paciente.crearPaciente(
    personaID: 256,
    titulo: 'Sr.',
    nombre: 'Juan',
    primerApellido: 'Perez',
    segundoApellido: 'Rodriguez',
    curp: 'JUAP920805HDFLLN08',
    grupoSanguineo: 'O+',
    fechaNacimiento: DateTime(1992, 8, 5),
    genero: 'M',
    nss: 'ANSISISNN12233',
    tipoSeguro: 'Privado',
    fechaRegistroPaciente: DateTime(2023, 10, 9),
    fechaUltimaCita: DateTime(2023, 10, 9),
    fechaRegistroPersona: DateTime(2020, 04, 18),
  );
  print('\n ------------------- Caso 1: Paciente nuevo ----------------------' );
  pacienteNuevo.leerPaciente();

  // Caso de prueba 2: Paciente ya registrado.
  Paciente pacienteExistente = Paciente(
    personaID: 125,
    titulo: 'Dra.',
    nombre: 'Martha',
    primerApellido: 'Flores',
    segundoApellido: 'Gomez',
    curp: 'MARF080108MDFLLL00',
    grupoSanguineo: 'A+',
    fechaNacimiento: DateTime(2008, 1, 8),
    genero: 'F',
    nss: 'SS1234567890',
    tipoSeguro: 'Privado',
    fechaUltimaCita: DateTime(2023, 10, 5),
    estatusMedico: 'Control',
    estatusVida: 'Vivo',
    estatus: true,
    fechaRegistroPaciente: DateTime(2020, 9, 12),
    fechaRegistroPersona: DateTime(2020, 12, 31),
  );
  print(' \n------------------------- Caso 2: Paciente ya registrado ----------------------' );
  pacienteExistente.leerPaciente();

  // Actualizar el paciente existente.
  pacienteExistente.actualizarPaciente(
    nuevoNombre: 'Martha G. Flores',
    nuevoNss: 'SS9876543210',
    nuevoTipoSeguro: 'Público',
    nuevoEstatusMedico: 'En tratamiento',
    nuevoEstatus: true,
  );

  pacienteExistente.leerPaciente();

  // Caso de prueba 3: Paciente fallecido.
  print(' \n ------------------------- Caso 3: Paciente fallecido ---------------');
  pacienteNuevo.leerPaciente(); // Muestra como vivo y activo
  pacienteNuevo.registrarDefuncion(); // Actualiza a finado y desactivado
  print('\n*********** La información del paciente ha sido actualizada.*********');
  pacienteNuevo.leerPaciente(); // Muestra como finado y desactivado

  // Caso 4: Eliminar paciente
  print(' \n ------------------------ Caso 4: Eliminar paciente -----------------');
  pacienteExistente.eliminarPaciente();
  pacienteExistente.leerPaciente();
}
