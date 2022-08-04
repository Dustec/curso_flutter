import 'package:flutter/material.dart';

class MainForecastValue extends StatelessWidget {
  const MainForecastValue({
    Key? key,
    required this.image,
    required this.data,
  }) : super(key: key);

  final String image;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 4),
        Text(data),
      ],
    );
  }
}
