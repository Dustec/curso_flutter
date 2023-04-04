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

  print(' a: $a b: $b c: $c ');
}
