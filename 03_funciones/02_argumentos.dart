void saludarPosicional(String nombre, String apellido) {
  print('Hola $nombre $apellido');
}

void saludarNombrado({
  required String nombre,
  String apellido = '',
}) {
  print('Hola $nombre $apellido');
}

void main(List<String> args) {
  saludarPosicional('Hector', 'Alvarez');
  saludarPosicional('Nicte', 'Marin');
  saludarPosicional('Miri', 'Macedonio');
  saludarNombrado(nombre: 'Yail');
  saludarNombrado(apellido: 'Valdespino', nombre: 'Yail');
}
