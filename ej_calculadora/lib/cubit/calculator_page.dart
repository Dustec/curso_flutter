import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator_cubit.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculatorCubit cubit = context.read();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.indigo,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (BuildContext context, CalculatorState state) {
                return _ResultsSection(
                  height: constraints.maxHeight * 0.25,
                  first: state.firstNumber,
                  second: state.secondNumber,
                  operation: state.operation,
                  result: state.result,
                );
              },
            ),
            _Keyboard(
              height: constraints.maxHeight * 0.75,
              onTap: cubit.getConcatOperation,
              onResult: cubit.calculateResult,
            ),
          ],
        );
      }),
    );
  }
}

class _ResultsSection extends StatelessWidget {
  const _ResultsSection({
    Key? key,
    required this.height,
    required this.first,
    required this.second,
    required this.operation,
    required this.result,
  }) : super(key: key);

  final double height;
  final String first;
  final String second;
  final String operation;
  final String result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(first, style: const TextStyle(fontSize: 18)),
                Text(operation, style: const TextStyle(fontSize: 18)),
                Text(second, style: const TextStyle(fontSize: 18)),
                const Divider(thickness: 2, color: Colors.black12),
                Text(result, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Container(
            color: Colors.pink,
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _Keyboard extends StatelessWidget {
  const _Keyboard({
    Key? key,
    required this.height,
    required this.onTap,
    required this.onResult,
  }) : super(key: key);

  final double height;
  final void Function(String value) onTap;
  final void Function() onResult;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                _SquareButton(
                  value: 'AC',
                  onTap: onTap,
                  color: Colors.pinkAccent,
                ),
                _SquareButton(
                  value: 'DELETE',
                  onTap: onTap,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
          ),

          //NOTA: Se puede crear un array, con los valores de las filas y crear un widget que haga una fila entera.
          // ...[7,8,9,/].map((String value)=>_SquareButton(value:value))
          Expanded(
            child: Row(
              children: <Widget>[
                _SquareButton(value: '7', onTap: onTap),
                _SquareButton(value: '8', onTap: onTap),
                _SquareButton(value: '9', onTap: onTap),
                _SquareButton(value: '/', onTap: onTap, color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                _SquareButton(value: '4', onTap: onTap),
                _SquareButton(value: '5', onTap: onTap),
                _SquareButton(value: '6', onTap: onTap),
                _SquareButton(value: 'X', onTap: onTap, color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                _SquareButton(value: '1', onTap: onTap),
                _SquareButton(value: '2', onTap: onTap),
                _SquareButton(value: '3', onTap: onTap),
                _SquareButton(value: '-', onTap: onTap, color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                _SquareButton(value: '.', onTap: onTap),
                _SquareButton(value: '0', onTap: onTap),
                _SquareButton(value: '=', onTap: (_) => onResult()),
                _SquareButton(value: '+', onTap: onTap, color: Colors.indigo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({
    Key? key,
    required this.value,
    required this.onTap,
    this.color = Colors.indigoAccent,
  }) : super(key: key);

  final String value;
  final void Function(String value) onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: () => onTap(value),
        fillColor: color,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        child: Center(child: Text(value)),
      ),
    );
  }
}
