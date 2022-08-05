part of 'clima_cubit.dart';

@freezed
class ClimaState with _$ClimaState {
  factory ClimaState({
    CurrentWeather? current,
    List<DayForecast>? daysList,
  }) = _ClimaState;
}
