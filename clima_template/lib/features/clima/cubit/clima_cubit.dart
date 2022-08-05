import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/current_weather.dart';
import '../models/day_forecast.dart';

part 'clima_cubit.freezed.dart';
part 'clima_state.dart';

const String apiKey = '8778beb154f78985b682cfa6a7ef811c';

class ClimaCubit extends Cubit<ClimaState> {
  ClimaCubit() : super(ClimaState()) {
    _init();
  }

  void _init() async {
    final json = await _request(endpoint: '/data/2.5/weather');
    final CurrentWeather currentWeather =
        CurrentWeather.fromJson(json as Map<String, dynamic>);

    emit(state.copyWith(current: currentWeather));
  }

  dynamic _request({
    required String endpoint,
    Map<String, dynamic> queryParams = const {
      'lat': 19.4326018,
      'lon': -99.1332049,
      'lang': 'sp',
      'units': 'metric',
      'appid': apiKey,
    },
  }) async {
    try {
      var response = await Dio().get('https://api.openweathermap.org$endpoint',
          queryParameters: queryParams);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
