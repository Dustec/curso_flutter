main() {
  // TIPOS PRIMITIVOS

  // ===== Números

// null != vacio

  int a = 10;
  double b = 5.5;

  // print(a);
  // print(b);

  int? c = null;

  int _a = 30;
  double $b = 40;

  double resultado = _a + $b;

  // print( resultado );

  // ===== String

  String nombre = 'Tony';
  String nombre2 = "Tony";
  String nombre3 = "O'Connor";
  String apellido = 'Stark';

  String nombreCompleto = '$nombre $apellido';

  // print(nombreCompleto);

  String multilinea = '''
  Hola Mundo
  ¿Cómo estás?
  $nombreCompleto
  O'Connor
  KDASDAS
  ''';

  // print(multilinea);

  // ===== Booleans
  bool isActive = true;
  bool isNotActive = !isActive;

  // print(isNotActive);

  // ===== Lists
  // List<String> villanosDeprecated = new List();
  List<String> villanos = ['Lex', 'Red Skull', 'Doom']; // Son base 0
  //                         0        1         2

  // List<dynamic> dynamicList = [false, 'Red Skull', 0, null, 0.0];

  villanos.add('Duende Verde');
  villanos.add('Duende Verde');
  villanos.add('Duende Verde');
  villanos.add('Duende Verde');
  villanos.add('Duende Verde');

  // print(villanos);

  var villanosSet = villanos.toSet();
  // print(villanosSet.toList());

  // ======== Sets
  Set<String> villanos2 = {'Lex', 'Red Skull', 'Doom'};

  villanos2.add('Duende Verde');
  villanos2.add('Duende Verde');
  villanos2.add('Duende Verde');
  villanos2.add('Duende Verde');
  villanos2.add('Duende Verde');

  // print(villanos2);

  // ====== Maps            Diccionarios / Objetos literales
  Map<int, dynamic> ironman = {
    1: 'Tony Stark',
    2: 'Inteligencia y el dinero',
    3: 9000,
  };

  // print(ironman[1]);
  Map<String, dynamic> capitan = Map();

  capitan.addAll({
    'nombre': 'Steve',
    'poder': 'Soportar droga sin morir',
    'nivel': 5000,
  });
  // capitan.addAll(ironman);

  print(capitan);
}
