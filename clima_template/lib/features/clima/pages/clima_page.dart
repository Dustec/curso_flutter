import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/clima_cubit.dart';
import '../models/day_forecast.dart';
import '../widgets/day_forecast_item.dart';
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
        title: BlocBuilder<ClimaCubit, ClimaState>(
            builder: (BuildContext context, ClimaState state) {
          return Text(
            state.current?.location ?? '',
            maxLines: 2,
            textAlign: TextAlign.center,
          );
        }),
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
            BlocBuilder<ClimaCubit, ClimaState>(
              builder: (context, state) {
                if (state.current?.weatherImage == null) {
                  return Image.asset(
                    'assets/cloud.png',
                    scale: 3,
                  );
                }
                return Image.network(
                  'http://openweathermap.org/img/wn/${state.current?.weatherImage}@4x.png',
                );
              },
            ),
            BlocBuilder<ClimaCubit, ClimaState>(
                builder: (BuildContext context, ClimaState state) {
              return Text(
                  ((state.current?.weatherDescription) ?? '').toUpperCase());
            }),
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
            const Text('A lo largo del día'),
            const Divider(
              color: Colors.white,
              indent: 12,
              endIndent: 12,
            ),
            BlocBuilder<ClimaCubit, ClimaState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ...(state.daysList ?? []).map((DayForecast e) =>
                            DayForecastItem(
                                weekDay: DateFormat('HH:mm')
                                    .format(e.date.toLocal()),
                                weatherImage:
                                    'http://openweathermap.org/img/wn/${e.weather}@2x.png',
                                temperature: '${e.temperature} °C')),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
