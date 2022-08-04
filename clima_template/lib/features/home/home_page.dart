import 'package:flutter/material.dart';

import '../clima/pages/clima_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClimaProvider();
  }
}
