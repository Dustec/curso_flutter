class Persona {
  // Constructores
  // Persona(
  //   this.nombre,
  //   this.apellido,
  //   this.edad,
  // );
  Persona({
    required this.nombre,
    required this.apellido,
    required this.edad,
  });

  // Propiedades
  String nombre;
  String apellido;
  int edad;
  String _curp = 'UNCURP020202';

  //Getters y setters
  String get nombreCompleto {
    return '$nombre $apellido';
  }

  void set curp(String curp) {
    this._curp = curp;
  }

  // Métodos
  @override
  String toString() {
    return '$nombre $apellido $edad $_curp';
  }
}
