void main() {
  var myName = 'Karen ALUN';
  String myLastName = "Fosade";
  final int myDNI = 210764;
  late final int myAge;
  
  // corregir mi nmbre 
  myName = "Karen Alyn";
  // myDNI:210764; ESTO ocaciono un error porque la variable esat definida como final y no puede
  
  

  print('Hola $myName $myLastName, tu matricula es: $myDNI y tu edad aun no la conozco, porque no se cuando naciste.');
  
  print('\nHola, ${myName.toUpperCase()} ${myLastName.toUpperCase()},  tu matricula es: $myDNI  y tu edad aun no la conozco, por que no se cuando naciste.');
  
}
