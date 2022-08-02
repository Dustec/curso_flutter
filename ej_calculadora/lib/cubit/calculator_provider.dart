import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_cubit.dart';
import 'calculator_page.dart';

class CalculatorProvider extends StatelessWidget {
  const CalculatorProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorCubit>(
      create: (_) => CalculatorCubit(),
      child: const CalculatorPage(),
    );
  }
}
