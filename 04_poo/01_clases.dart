import 'clases/persona.dart';

void main(List<String> args) {
  Persona persona =
      new Persona(nombre: 'Hector', apellido: 'Alvarez', edad: 25);
  Persona persona2 =
      new Persona(edad: 24, apellido: 'Macedonio', nombre: 'Miriam');

  persona.curp = 'OTROCURP20202030303';

  print(persona.nombreCompleto);
  print(persona.toString());
  print(persona2.toString());
}
