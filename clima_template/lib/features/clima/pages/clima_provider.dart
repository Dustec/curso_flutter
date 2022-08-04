import 'package:clima_template/features/clima/cubit/clima_cubit.dart';
import 'package:clima_template/features/clima/pages/clima_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimaProvider extends StatelessWidget {
  const ClimaProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClimaCubit>(
      create: (_) => ClimaCubit(),
      child: const ClimaPage(),
    );
  }
}
