class Persona {
  // Constructores

  // Propiedades
  String? nombre;
  String? apellido;
  int? edad;
  String _curp = 'UNCURP020202';

  //Getters y setters
  String get nombreCompleto {
    return '$nombre $apellido';
  }

  void set curp(String nuevoCurp) {
    _curp = nuevoCurp;
  }

  // Métodos
  @override
  String toString() {
    return '$nombre $apellido $edad $_curp';
  }
}

void main(List<String> args) {
  Persona persona = new Persona();

  persona.nombre = 'Yail';
  persona.apellido = 'Valdepino';
  persona.edad = 25;
  persona.curp = 'OTROCURP20202030303';

  print(persona.nombreCompleto);
  print(persona.toString());
}
