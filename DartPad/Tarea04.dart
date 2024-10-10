// 1. Definición de la clase abstracta <Persona>
abstract class Persona {
  int personaID;  // ID único para identificar a cada persona.
  String? nombre;  // Nombre opcional de la persona.
  DateTime fechaNacimiento;  // Fecha de nacimiento de la persona.
  String? genero;  // Género opcional de la persona (masculino, femenino, etc.).

  // Constructor que inicializa los atributos de la clase abstracta Persona.
  Persona({
    required this.personaID,  // 'required' indica que este argumento es obligatorio.
    this.nombre,  // El nombre es opcional.
    required this.fechaNacimiento,  // La fecha de nacimiento es obligatoria.
    this.genero,  // El género es opcional.
  });

  // 2. Definición de la función de la clase
  // Método para mostrar información general de la persona. 
  // En caso de que el nombre o el género no estén definidos, muestra un valor predeterminado.
  void mostrarInformacion() {
    print('ID Persona: $personaID');
    print('Nombre: ${nombre ?? 'Desconocido'}');  // Si el nombre es nulo, muestra 'Desconocido'.
    print('Fecha de Nacimiento: $fechaNacimiento');  // Muestra la fecha de nacimiento.
    print('Género: ${genero ?? 'No especificado'}');  // Si el género es nulo, muestra 'No especificado'.
  }
}

// 3. Declaración de las propiedades de la clase <Paciente>
// Clase que extiende de Persona (Paciente es una Persona).
class Paciente extends Persona {
  String? nss;  // Número de seguridad social opcional (siguiendo el estilo lowerCamelCase).
  String? tipoSeguro;  // Tipo de seguro médico que tiene el paciente.
  DateTime? fechaUltimaCita;  // Fecha de la última cita médica del paciente.
  String? estatusMedico;  // Estado médico del paciente (ej. Activo, Control, etc.).
  String estatusVida;  // Estado de vida del paciente (Vivo, Finado).
  bool estatus;  // Indica si el paciente está activo (true) o inactivo (false).
  DateTime fechaRegistro;  // Fecha en la que el paciente fue registrado en el sistema.
  DateTime? fechaActualizacion;  // Fecha en la que se actualizó la información del paciente por última vez.

  // Constructor que inicializa las propiedades del paciente y las de la clase Persona.
  Paciente({
    required int personaID,  // ID único para el paciente.
    String? nombre,  // Nombre del paciente.
    required DateTime fechaNacimiento,  // Fecha de nacimiento del paciente.
    String? genero,  // Género del paciente.
    this.nss,  // NSS opcional.
    this.tipoSeguro,  // Tipo de seguro opcional.
    this.fechaUltimaCita,  // Fecha de última cita opcional.
    this.estatusMedico,  // Estado médico opcional.
    required this.estatusVida,  // Estado de vida es obligatorio.
    required this.estatus,  // El estatus (activo/inactivo) es obligatorio.
    required this.fechaRegistro,  // La fecha de registro es obligatoria.
    this.fechaActualizacion,  // Fecha de actualización opcional.
  }) : super(
          personaID: personaID,  // Llama al constructor de la clase Persona.
          nombre: nombre,
          fechaNacimiento: fechaNacimiento,
          genero: genero,
        );

  // 4. Sobreescritura de las propiedades de la clase abstracta <Persona>
  // Sobreescribe el método mostrarInformacion() de la clase Persona para incluir detalles específicos del paciente.
  @override
  void mostrarInformacion() {
    super.mostrarInformacion();  // Llama a la versión de mostrarInformacion() de Persona.
    print('NSS: ${nss ?? 'No registrado'}');  // Si el NSS es nulo, muestra 'No registrado'.
    print('Tipo de Seguro: ${tipoSeguro ?? 'No especificado'}');  // Si no tiene seguro, muestra 'No especificado'.
    print('Fecha Última Cita: ${fechaUltimaCita ?? 'No disponible'}');  // Si no tiene cita, muestra 'No disponible'.
    print('Estatus Médico: ${estatusMedico ?? 'No disponible'}');  // Si no tiene estatus médico, muestra 'No disponible'.
    print('Estatus Vida: $estatusVida');  // Muestra si el paciente está vivo o fallecido.
    print('Activo: ${estatus ? 'Sí' : 'No'}');  // Muestra si el paciente está activo o no.
    print('Fecha de Registro: $fechaRegistro');  // Muestra la fecha en la que fue registrado el paciente.
    print('Fecha de Actualización: ${fechaActualizacion ?? 'No disponible'}');  // Muestra la última actualización.
  }

  // 6. Sobreescritura de la función registrarDefuncion()
  // Método para marcar al paciente como fallecido.
  void registrarDefuncion() {
    estatusVida = 'Finado';  // Cambia el estado de vida del paciente a 'Finado' (fallecido).
    estatus = false;  // Cambia el estatus del paciente a inactivo.
    fechaActualizacion = DateTime.now();  // Actualiza la fecha de actualización con la fecha actual.
    print('El paciente ha sido registrado como fallecido.');  // Muestra un mensaje indicando el cambio.
  }

  // 7. Métodos CRUD

  // Crear un nuevo paciente
  // Método estático para crear un paciente nuevo con la información requerida.
  static Paciente crearPaciente({
    required int personaID,
    String? nombre,
    required DateTime fechaNacimiento,
    String? genero,
    String? nss,  // NSS opcional.
    String? tipoSeguro,  // Tipo de seguro opcional.
    String estatusVida = 'Vivo',  // Por defecto, el estado de vida será 'Vivo'.
    bool estatus = true,  // Por defecto, el paciente estará activo.
  }) {
    return Paciente(
      personaID: personaID,  // ID del paciente.
      nombre: nombre,  // Nombre del paciente.
      fechaNacimiento: fechaNacimiento,  // Fecha de nacimiento.
      genero: genero,  // Género.
      nss: nss,  // NSS.
      tipoSeguro: tipoSeguro,  // Tipo de seguro.
      estatusVida: estatusVida,  // Estado de vida.
      estatus: estatus,  // Estatus activo.
      fechaRegistro: DateTime.now(),  // Fecha de registro, que será la fecha actual.
    );
  }

  // Leer la información del paciente
  void leerPaciente() {
    mostrarInformacion();  // Llama al método mostrarInformacion() para ver los datos del paciente.
  }

  // Actualizar la información del paciente
  // Método para actualizar datos específicos del paciente.
  void actualizarPaciente({
    String? nuevoNombre,  // Nombre nuevo (opcional).
    String? nuevoNss,  // NSS nuevo (opcional).
    String? nuevoTipoSeguro,  // Tipo de seguro nuevo (opcional).
    String? nuevoEstatusMedico,  // Estado médico nuevo (opcional).
    bool? nuevoEstatus,  // Estatus nuevo (opcional, activo/inactivo).
  }) {
    if (nuevoNombre != null) nombre = nuevoNombre;  // Si se proporciona un nuevo nombre, lo actualiza.
    if (nuevoNss != null) nss = nuevoNss;  // Si se proporciona un nuevo NSS, lo actualiza.
    if (nuevoTipoSeguro != null) tipoSeguro = nuevoTipoSeguro;  // Si se proporciona un nuevo tipo de seguro, lo actualiza.
    if (nuevoEstatusMedico != null) estatusMedico = nuevoEstatusMedico;  // Si se proporciona un nuevo estatus médico, lo actualiza.
    if (nuevoEstatus != null) estatus = nuevoEstatus;  // Si se proporciona un nuevo estatus, lo actualiza.
    fechaActualizacion = DateTime.now();  // Actualiza la fecha de actualización con la fecha actual.
    print('La información del paciente ha sido actualizada.');  // Muestra un mensaje indicando la actualización.
  }

  // Eliminar el registro de un paciente (simplemente lo desactivamos)
  void eliminarPaciente() {
    estatus = false;  // Cambia el estatus del paciente a inactivo.
    print('El paciente ha sido eliminado (estatus inactivo).');  // Muestra un mensaje indicando que el paciente ha sido desactivado.
  }
}

// 8. Uso de Extends / Implements
void main() {
  // 9. Caso de prueba 1: Paciente nuevo
  // Se crea un paciente nuevo usando el método estático crearPaciente().
  Paciente pacienteNuevo = Paciente.crearPaciente(
    personaID: 256,
    nombre: 'Juan Perez Rodriguez',
    fechaNacimiento: DateTime(1992, 8, 5),
    genero: 'Masculino',
    nss: 'ANSISISNN12233',  // NSS del paciente.
    tipoSeguro: 'IMSS',  // Tipo de seguro del paciente.
  );
  print('Caso 1: Paciente nuevo');
  pacienteNuevo.leerPaciente();  // Muestra la información del paciente nuevo.

  // 10. Caso de prueba 2: Paciente ya registrado
  // Se crea un paciente ya registrado con datos específicos.
  Paciente pacienteExistente = Paciente(
    personaID: 125,
    nombre: 'Martha Flores',
    fechaNacimiento: DateTime(2008, 1, 8),
    genero: 'Femenino',
    nss: 'IMSS1234567890',  // NSS del paciente.
    tipoSeguro: 'IMSS',  // Tipo de seguro.
    fechaUltimaCita: DateTime(2023, 10, 5),  // Última cita médica del paciente.
    estatusMedico: 'Control',  // Estatus médico.
    estatusVida: 'Vivo',  // Estado de vida.
    estatus: true,  // Estatus activo.
    fechaRegistro: DateTime(2020, 9, 12),  // Fecha de registro del paciente.
    fechaActualizacion: DateTime(2024, 1, 5),  // Última fecha de actualización.
  );
  print('\nCaso 2: Paciente ya registrado');
  pacienteExistente.leerPaciente();  // Muestra la información del paciente existente.

  // Actualizar el paciente existente
  pacienteExistente.actualizarPaciente(
    nuevoNombre: 'Martha G. Flores',  // Actualiza el nombre.
    nuevoNss: 'IMSS9876543210',  // Actualiza el NSS.
    nuevoEstatusMedico: 'En observación',  // Actualiza el estado médico.
  );
  pacienteExistente.leerPaciente();  // Muestra la información actualizada.

  // 11. Caso de prueba 3: Paciente fallecido
  print('\nCaso 3: Paciente fallecido');
  pacienteNuevo.registrarDefuncion();  // Marca al paciente nuevo como fallecido.
  pacienteNuevo.leerPaciente();  // Muestra la información del paciente fallecido.

  // Caso 4: Eliminar paciente
  print('\nCaso 4: Eliminar paciente');
  pacienteExistente.eliminarPaciente();  // Elimina (desactiva) el paciente existente.
  pacienteExistente.leerPaciente();  // Muestra la información del paciente eliminado.
}
