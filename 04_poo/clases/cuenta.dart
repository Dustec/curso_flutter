class Cuenta {
  // Cuenta(
  //   this.titular, {
  //   this.cantidad,
  // });

  // final String titular;
  // double? cantidad;

  Cuenta({
    required this.titular,
    this.cantidad = 0.0,
  });

  String titular;
  double cantidad;

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
    this.cantidad += cantidad;
  }

  void retirar(double cantidad) {
    this.cantidad -= cantidad;
    if (this.cantidad < 0) {
      this.cantidad = 0.0;
    }
  }
}
