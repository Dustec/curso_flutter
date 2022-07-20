import 'dart:io';

main() {
  // estructura

  bool shouldExecute = true;
  String nombre = 'Hector';

  // if

  // if (shouldExecute) {
  //   print('Me ejecuté');
  // }

  // if else

  // if (shouldExecute) {
  //   // se ejecuta si la condicion es verdadera
  //   print('Me ejecuté');
  // } else {
  //   // se ejecuta si la condicion no es verdadera
  //   print('else');
  // }

  // if else if

  if (nombre == 'Yail') {
    // se ejecuta si la condicion es verdadera

  } else if (nombre == 'Hector') {
    // se ejecuta si la condicion no es verdadera

  } else {
    // todos los demás casos
  }

  stdout.writeln('¿Cual es tu edad?');

  late int edad;

  edad = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (edad >= 18) {
    stdout.writeln('Eres mayor de edad');
  } else {
    stdout.writeln('Eres menor de edad');
  }

  /* EJERCICIO
    Crear un programa en dart que:
      Si eres mayor o igual a 21 años, mostrar la palabra "ciudadano"
      Si estás entre 18 y 20 (incluyendo 18), mostrar "Mayor de edad"
      Si eres menor a 18 (sin contar 18), mostrar "menor de edad"
      
      28 ciudadano
      21 ciudadano
      20 mayor de edad
      18 mayor de edad
      17 menor de edad
  */
}
