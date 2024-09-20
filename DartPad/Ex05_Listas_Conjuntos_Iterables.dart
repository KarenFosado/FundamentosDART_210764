void main() {
  // Listas (LIST)
  // La declaracion de una LIST esta eliminada por corchetes (brackets) , y cada       elemento de ser individuall y puede repetirse
  final numeros = [1, 2, 2, 2, 3, 4, 5, 6, 7, 7, 7, 7, 8, 8, 9, 10];

  print("  Ejemplo  de LIST: $numeros");
  print ("Confrmamos el tipo de dato para numeros que es: ${numeros.runtimeType}");
  print("podemos acceder a cierta informacion de un alista tal como: ");
  print("El tamaño: $numeros:length");
  print(""" Para acceder a los elementos debemos especificar laposicion entre[] 
  El primer elemto en la primera posiicon es: ${numeros[0]}
  El elemto en la segunda posicion es: ${numeros[1]}, simepre respetando el posicion-1
  El ultimo elemto de la lsta seria: ${numeros[numeros.length - 1]}
  -----------------------------------------------------------------------------
  
  De igual manera existe las siguientes alternativas
  primero elemento ${numeros.first}
  ultimo elemento ${numeros.last}
  
  
  ---------------------------------------------------------------------------
  tambien tendremos acceso a algunos metodos qu permiten la transfirmacion o el filtrado del conetenido
  por ejemplo usar reversed para invetir el orden original: ${numeros.reversed}
  Es importante observar que la funsion reversed ha trransformado la LIST orifginal y la retorna como un 
  ITERABLE
  
  
    """);
  
  final numerosReves = numeros.reversed;
  
  print ("Los iterables son estructuras de datos que DART y otros lenguajes para optimizar en terminos de velocidad el acceso a los datos y propiedades");
  print("EJMEPLO EN ITERABLE: $numerosReves");
 print ("Confrmamos el tipo de dato para numerosReves que es:${numerosReves.runtimeType}");
  print("De igaul manera podemos transformar una LISTA  en ITERABLE Y viceversa ");
  print(
    " Convetimos el ITERABLE e LISTA usanso .toList() : ${numerosReves.toList()} y veridicamos su tipo de dato ${numerosReves.toList().runtimeType}");
  //conjunto de datos (SET)

  print ("""veamos que pasa con los conjuntos (SET)
  CONVETIMOS EL ITERABLE EN UN SET USNADO .toSET: ${numerosReves.toSet()}
  
  podemos visualizar en el resultado que es el SET a eliminado los duplicados y ahora delimita los datos usando {}.
  """);
  
  // De igual manera podemos realizar operaciones para 
  
  final numerosMayoresA5 = numeros.where((int num) {
    return num >5;
  });
  
  
  print ("""Hemos  filtrado sobre LIST solo los elemtos mayores a 5: 
  RESUKLTADO DE FILTRO : ${numerosMayoresA5}""");
  print (""" eliminamos duplicados .. ${numerosMayoresA5.toSet()}""");
}

