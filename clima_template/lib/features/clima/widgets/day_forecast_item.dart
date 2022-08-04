import 'package:flutter/material.dart';

class DayForecastItem extends StatelessWidget {
  const DayForecastItem({
    Key? key,
    required this.weekDay,
    required this.weatherImage,
    required this.temperature,
  }) : super(key: key);

  final String weekDay;
  final String weatherImage;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weekDay),
        Image.asset(
          weatherImage,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 4),
        Text(temperature),
      ],
    );
  }
}
