import 'dart:io';

main() {
  // imprimir en terminal o cmd
  // stdout.write('Hola Mundo!');

  stdout.writeln('¿Cual es tu nombre?');

  //obtener info ingresada por usuario

  String? nombre = stdin.readLineSync();

  stdout.write('Tu nombre es' + (nombre ?? ''));

  // o se puede concaternar
}
