void main() async {
  // Inicio del programa, se imprime un mensaje en la consola
  print('Inicio del programa');

  try {
    // Se llama a la función httpGet y se espera su resultado
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Se imprime el resultado de la petición, si es exitosa
    print(value);
  } catch (err) {
    // Si ocurre un error durante la petición, se captura y se imprime un mensaje de error
    print('Tenemos un error: $err');
  }

  // Fin del programa, se imprime un mensaje en la consola
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // Simula un retraso de 1 segundo antes de proceder
  await Future.delayed(const Duration(seconds: 1));

  // Lanza un error intencionalmente para simular un fallo en la petición
  throw 'Error en la petición';

  // La siguiente línea está comentada; si estuviera activa, 
  // devolvería un valor en caso de éxito
  // return 'Tenemos un valor de la petición';
}
