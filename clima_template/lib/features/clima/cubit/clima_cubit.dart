import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clima_cubit.freezed.dart';
part 'clima_state.dart';

class ClimaCubit extends Cubit<ClimaState> {
  ClimaCubit() : super(ClimaState());

  void getData() async {
    try {
      // 19.5939894,-99.1988758
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?lat=19.5939894&lon=-99.1988758&appid=d85e1968e37b04559d71f0eafb31e18f');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
