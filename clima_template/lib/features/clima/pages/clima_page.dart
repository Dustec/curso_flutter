import '../cubit/clima_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClimaCubit cubit = context.read();
    return Center(
      child: ElevatedButton(
        onPressed: () => cubit.getData(),
        child: Text('get data'),
      ),
    );
  }
}
