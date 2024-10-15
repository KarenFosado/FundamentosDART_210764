void main() {
  // Inicia la emisión de números y se suscribe al stream
  emitNumbers().listen((value) {
    // Imprime el valor recibido del stream cada vez que se emite un nuevo número
    print('Stream value: $value');
  });
} 

Stream<int> emitNumbers() {
  // Crea un stream que emite un número cada segundo
  return Stream.periodic(const Duration(seconds: 1), (value) {
    // La función de callback devuelve el número que representa el valor actual
    // Esta línea está comentada, pero podría usarse para depurar
    // print('desde periodic $value');
    return value; // Devuelve el valor actual del contador
  }).take(5); // Limita la emisión a los primeros 5 valores
}
