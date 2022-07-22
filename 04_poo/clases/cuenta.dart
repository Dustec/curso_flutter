class Cuenta {
  // Cuenta(
  //   this.titular, {
  //   this.cantidad,
  // });

  // final String titular;
  // double? cantidad;

  Cuenta({
    required this.titular,
    this.cantidad,
  });

  String titular;
  double? cantidad;

  String get informacionDeLaCuenta {
    return 'La cuenta de $titular tiene \$$cantidad';
  }

  void set cambiarTitular(String nuevoTitular) {
    titular = nuevoTitular;
  }

  void ingresar(double cantidad) {
    if (cantidad < 0) {
      return;
    }
    // this.cantidad += cantidad;
    this.cantidad = (this.cantidad ?? 0) + cantidad;
  }

  void retirar(double cantidad) {
    // this.cantidad -= cantidad;
    this.cantidad = (this.cantidad ?? 0) - cantidad;
    if ((this.cantidad ?? 0) < 0) {
      this.cantidad = 0.0;
    }
  }
}
