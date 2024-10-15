void main() {
  
  // Se imprime un mensaje indicando que el programa ha iniciado
  print('Inicio del programa');
  
  // Se realiza una petición HTTP simulada a la URL especificada. 
  // Esta función devuelve un "Future", lo que significa que es una operación asíncrona.
  httpGet('https://fernando-herrera.com/cursos')
    .then( 
      // Si la petición se completa con éxito, se ejecuta esta función que recibe el valor resultante
      (value) {
        print(value);  // Se imprime el valor devuelto por la petición
      })
    .catchError( (err) { 
      // En caso de que ocurra un error en la petición, se captura aquí
      print('Error: $err');  // Se imprime el error que ocurrió
    });
  
  // Se imprime este mensaje independientemente de si la petición HTTP ha terminado, 
  // ya que la operación es asíncrona (no se espera a que termine).
  print('Fin del programa');
}


// Esta función simula una petición HTTP, devolviendo un Future<String>.
// Future.delayed retrasa la ejecución por 1 segundo para simular una espera.
Future<String> httpGet(String url) {
  
  return Future.delayed(const Duration(seconds: 1), () {
    
    // Aquí se lanza una excepción simulando un error en la petición HTTP
    throw 'Error en la petición http';
    
    // Si todo hubiera salido bien, se devolvería una respuesta de la petición HTTP (esto está comentado).
    // return 'Respuesta de la petición http';
    
  });
  
}
