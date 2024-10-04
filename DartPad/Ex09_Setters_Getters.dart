void main() {
  final mySquare = Square(side: 18); // Constructor correcto usando el parámetro 'side'

  try {
    mySquare.side = -32; // Intenta asignar un valor negativo
  } catch (e) {
    print(e); // Maneja la excepción y muestra el error
  }

  print("Lado del Cuadrado: ${mySquare.side}");
  print("Área que ocupa: ${mySquare.calculateArea()}");
}

class Square {
  double _side;

  Square({required double side}) : _side = side;

  double get side => _side;

  set side(double value) {
    print("Asignando un nuevo valor al lado: $value");
    if (value < 0) throw 'El valor del lado debe ser mayor a 0.';
    _side = value;
  }

  double calculateArea() {
    return _side * _side; // Retorna el área correctamente
  }
}
