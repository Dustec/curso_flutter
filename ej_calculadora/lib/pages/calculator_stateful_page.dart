import 'package:flutter/material.dart';

class CalculatorStatefulPage extends StatefulWidget {
  const CalculatorStatefulPage({Key? key}) : super(key: key);

  @override
  State<CalculatorStatefulPage> createState() => _CalculatorStatefulPageState();
}

class _CalculatorStatefulPageState extends State<CalculatorStatefulPage> {
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
            ),
            _Keyboard(
              height: constraints.maxHeight * 0.75,
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
  }) : super(key: key);

  final double height;

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
              children: const <Widget>[
                Text('2000000', style: TextStyle(fontSize: 18)),
                Text('+', style: TextStyle(fontSize: 18)),
                Text('11', style: TextStyle(fontSize: 18)),
                Divider(color: Colors.black12),
                Text('81', style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
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
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: const <Widget>[
                _SquareButton(value: '7'),
                _SquareButton(value: '8'),
                _SquareButton(value: '9'),
                _SquareButton(value: '/', color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const <Widget>[
                _SquareButton(value: '4'),
                _SquareButton(value: '5'),
                _SquareButton(value: '6'),
                _SquareButton(value: 'X', color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const <Widget>[
                _SquareButton(value: '1'),
                _SquareButton(value: '2'),
                _SquareButton(value: '3'),
                _SquareButton(value: '-', color: Colors.indigo),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const <Widget>[
                _SquareButton(value: '.'),
                _SquareButton(value: '0'),
                _SquareButton(value: '='),
                _SquareButton(value: '+', color: Colors.indigo),
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
    this.onTap,
    this.color = Colors.indigoAccent,
  }) : super(key: key);

  final String value;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: () {},
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
