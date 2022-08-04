import '../cubit/clima_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClimaCubit cubit = context.read();
    const Color backgroundColor = Colors.blue;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        title: const Text(
          'Cuautitlán Izcalli, Estado de México.',
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => cubit.getData(),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset('assets/cloud.png'),
        ],
      ),
    );
  }
}
