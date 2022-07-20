import 'dart:io';

main() {
  // imprimir en terminal o cmd
  // print('Hola Mundo!!!');
  // stdout.writeln('Hola Mundo!');
  // stdout.write('Hola Mundo!');

  stdout.writeln('¿Cual es tu nombre?');

  //obtener info ingresada por usuario

  String? nombre = stdin.readLineSync();

  stdout.writeln('Tu nombre es: $nombre');

  // o se puede concaternar
}
