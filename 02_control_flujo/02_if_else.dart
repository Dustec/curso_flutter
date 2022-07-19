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

  if (edad >= 18) {
    stdout.writeln('Eres mayor de edad');
  } else {
    stdout.writeln('Eres menor de edad');
  }
}
