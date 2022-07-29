import 'package:flutter/material.dart';

class CalculatorStatefulPage extends StatefulWidget {
  const CalculatorStatefulPage({Key? key}) : super(key: key);

  @override
  State<CalculatorStatefulPage> createState() => _CalculatorStatefulPageState();
}

class _CalculatorStatefulPageState extends State<CalculatorStatefulPage> {
  String _firstNumber = '';
  String _secondNumber = '';
  String _operation = '';
  String _concatOperation = '';

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Básica'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            _ResultsSection(
              height: constraints.maxHeight * 0.25,
              first: _firstNumber,
              second: _secondNumber,
              operation: _operation,
              result: _result,
            ),
            _Keyboard(
              height: constraints.maxHeight * 0.75,
              onTap: _getConcatOperation,
              onResult: _getResult,
            ),
          ],
        );
      }),
    );
  }

  void _getConcatOperation(String value) {
    if (['+', '-', '/', 'X'].contains(value)) {
      setState(() {
        _operation = value;
        _concatOperation += value;
      });
      return;
    }
    setState(() {
      if (_operation.isEmpty) {
        _firstNumber += value;
        _concatOperation += value;
      } else {
        _secondNumber += value;
        _concatOperation += value;
      }
    });
  }

  void _getResult() {
    setState(() {
      if (_firstNumber.isEmpty || _secondNumber.isEmpty || _operation.isEmpty) {
        _result = 'Operación no válida';
        return;
      }

      final List<String> resultList = _concatOperation.split(_operation);

      final double first = double.parse(resultList[0]);
      final double second = double.parse(resultList[1]);

      switch (_operation) {
        case '+':
          _result = '${first + second}';
          break;
        case '-':
          _result = '${first - second}';
          break;
        case '/':
          _result = (first / second).toStringAsFixed(4);
          break;
        case 'X':
          _result = (first * second).toStringAsFixed(4);
          break;
        default:
      }
    });
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
                const Divider(color: Colors.black12),
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
        child: Center(
            child: Text(
          value,
        )),
      ),
    );
  }
}
