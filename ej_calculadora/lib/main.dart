import 'package:ej_calculadora/cubit/calculator_provider.dart';
// import 'package:ej_calculadora/pages/calculator_stateful_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const CalculatorProvider(),
      // home: const CalculatorStatefulPage(),
    );
  }
}
