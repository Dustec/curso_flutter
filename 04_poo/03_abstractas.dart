abstract class Vehiculo {
  bool encendido = false;

  void encender() {
    encendido = true;
    print('Vehiculo encendido');
  }

  void apagar() {
    encendido = false;
    print('Vehiculo apagado');
  }

  void revisarMotor();
}

class Carro extends Vehiculo {
  double kilometraje = 0;

  @override
  void encender() {
    print('Puse el clutche');
    super.encender();
  }

  @override
  void revisarMotor() {
    print('Motor OK!');
  }
}

class Moto extends Vehiculo {
  void hacerTrucos() {
    print('Que buen truco carnal');
  }

  @override
  void revisarMotor() {
    print('Motor MALO!');
  }
}

void main(List<String> args) {
  Carro spark = new Carro();
  Moto harley = new Moto();

  spark.encender();
  spark.apagar();

  harley.encender();
}
