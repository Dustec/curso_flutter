main() {
  // mutable
  int a = 10;

  a = 20;

  // inmutable
  final double b = 10;

  const double c = 10;

  final double z;

  late final double x;
  x = 10;

  print(x);

  // Late te permitirá incializarla después
  z = 20;

  print('Resultado: $z');

  // a = 20;
  // b = 20;
  // c = 20;

  // final personasFinal = ['Juan', 'Pedro', 'Fernando'];
  // const personasConst = ['Juan', 'Pedro', 'Fernando'];

  final List<String> personasFinal = ['Juan', 'Pedro', 'Fernando'];
  const List<String> personasConst = ['Juan', 'Pedro', 'Fernando'];

  personasFinal.add('Maria');
  // personasConst.add('Maria');

  // personasFinal = [];

  print(personasFinal);
}
