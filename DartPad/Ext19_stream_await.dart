void main() {
  // Inicia la emisión de números y se suscribe al stream
  emitNumber().listen((int value) {
    // Imprime el valor recibido del stream cada vez que se emite un nuevo número
    print('Stream value: $value');
  });
}

Stream<int> emitNumber() async* {
  // Define una lista de valores a emitir
  final valuesToEmit = [1, 2, 3, 4, 5];

  // Itera sobre cada valor en la lista
  for (int i in valuesToEmit) {
    // Espera 1 segundo antes de emitir el siguiente valor
    await Future.delayed(const Duration(seconds: 1));
    // Emite el valor actual usando yield
    yield i;
  }
}
