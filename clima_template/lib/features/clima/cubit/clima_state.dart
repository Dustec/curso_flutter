part of 'clima_cubit.dart';

@freezed
class ClimaState with _$ClimaState {
  factory ClimaState({
    @Default('') temperature,
    @Default('') humidity,
    @Default('') windSpeed,
  }) = _ClimaState;
}
