void main() async {
  // Imprime un mensaje indicando que el programa ha comenzado
  print('Inicio del programa');

  try {
    // Intenta hacer una llamada asíncrona a httpGet y espera el resultado
    final value = await httpGet('https://fernando-herrera.com/cursos');
    // Si tiene éxito, imprime el valor obtenido
    print('éxito: $value');
  } on Exception catch(err) {
    // Captura específicamente excepciones y las maneja
    print('Tenemos una Exception: $err');
  } catch (err) {
    // Captura cualquier otro tipo de error y lo maneja de forma más general
    print('OOP!! algo terrible pasó: $err');
  } finally {
    // Este bloque se ejecuta siempre, independientemente de si hubo un error
    print('Fin del try y catch');
  }

  // Imprime un mensaje indicando que el programa ha terminado
  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  // Simula un retraso de 1 segundo antes de realizar la operación
  await Future.delayed(const Duration(seconds: 1));

  // Lanza una excepción para simular un error en la petición
  throw Exception('No hay parámetros en el URL');

  // Las siguientes líneas están comentadas, pero podrían usarse para manejar otras respuestas
  // throw 'Error en la petición';
  // return 'Tenemos un valor de la petición';
}
