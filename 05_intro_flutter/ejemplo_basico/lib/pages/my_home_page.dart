// Este es un custom widget

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Conteo:',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '$_conteo',
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: incrementaNumero,
                  child: const Text('+1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _conteo = 0;
                    });
                  },
                  child: const Text('0'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _conteo--;
                    });
                  },
                  child: const Text('-1'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void incrementaNumero() {
    setState(() {
      _conteo++;
    });
  }
}
