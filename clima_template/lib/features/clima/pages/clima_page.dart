import 'package:clima_template/features/clima/widgets/day_forecast_item.dart';

import '../cubit/clima_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/main_forecast_value.dart';

class ClimaPage extends StatelessWidget {
  const ClimaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClimaCubit cubit = context.read();
    const Color backgroundColor = Colors.blue;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        title: const Text(
          'Cuautitlán Izcalli, Estado de México.',
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cloud.png',
              scale: 3,
            ),
            const Text('LLUVIA MODERADA'),
            const SizedBox(height: 24),
            BlocBuilder<ClimaCubit, ClimaState>(
                builder: (BuildContext context, ClimaState state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MainForecastValue(
                    image: 'assets/thermometer.png',
                    data: '${(state.current?.temperature) ?? 0} °C',
                  ),
                  MainForecastValue(
                    image: 'assets/water-drop.png',
                    data: '${(state.current?.humidity) ?? 0} %',
                  ),
                  MainForecastValue(
                    image: 'assets/wind.png',
                    data: '${(state.current?.windSpeed) ?? 0.0} m/s',
                  ),
                ],
              );
            }),
            const SizedBox(height: 24),
            const Text('Siguientes 5 días'),
            const Divider(
              color: Colors.white,
              indent: 12,
              endIndent: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ...['LUN', 'MAR', 'MIE', 'JUE', 'VIE'].map((String e) =>
                      DayForecastItem(
                          weekDay: e,
                          weatherImage: 'assets/cloud.png',
                          temperature: '39 °C')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
