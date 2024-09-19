//Nombre Ext03_Datos_Dinamicos.dart
void main(){
  //Practica 05: Tipos de Datos Dinamicos (Dynamic - Comodín)

  //Se puede declarar sin inicializard
  dynamic errorMessage;

  print(''' El error inicial de errorMessage es : $errorMessage
  que por defecto permite establecer valores nulos''');

  //Ahora le asignamos un valor String
  errorMessage = "El usuario y contraseña son incorrectos";

  errorMessage = 404;(''' ----------------------------------------------
  El nuevo valor de errorMessage es: $errorMessage
  En algunos sistemas los errores son controlados por un codigo numerico.''');

  errorMessage = false;(''' ----------------------------------------------
  El nuevo valor de errorMessage es: $errorMessage
  Cuando el sistema fuciona correctamente el mensahe de error puede sr FALSO.''');

  errorMessage = [400,404,500,502,505];(''' ----------------------------------------------
  El nuevo valor de errorMessage es: $errorMessage
  En caso de que el sistema detecte varios errores puedes agregar alguna lista''');

  errorMessage = {125, "Usuario no Encontrado", true, -1025.16 ,'A'};(''' ----------------------------------------------
  El nuevo valor de errorMessage es: $errorMessage
  O inicluso como un conjunto  (SET) de datos''');

  errorMessage = ()=>true;(''' ----------------------------------------------
  El ultimo cambio de errorMensage es: $errorMessage
  Cuando el sistema fuciona correctamente el mensahe de error puede sr FALSO.''');

}