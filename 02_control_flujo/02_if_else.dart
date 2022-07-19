import 'dart:io';

main() {
  // estructura
  /*
  if(condicion) {
      // se ejecuta si la condicion es verdadera
  } else {
      // se ejecuta si la condicion no es verdadera
  }
  */

  stdout.writeln('¿Cual es tu edad?');

  late int edad;

  // edad = stdin.readLineSync();

  // if (edad >= 18) {
  //   stdout.writeln('Eres mayor de edad');
  // } else {
  //   stdout.writeln('Eres menor de edad');
  // }

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
