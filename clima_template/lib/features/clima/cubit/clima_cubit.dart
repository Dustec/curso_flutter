import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clima_cubit.freezed.dart';
part 'clima_state.dart';

const String apiKey = '8778beb154f78985b682cfa6a7ef811c';

class ClimaCubit extends Cubit<ClimaState> {
  ClimaCubit() : super(ClimaState());

  void getData() async {
    try {
      // 19.5939894,-99.1988758
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?lat=19.5939894&lon=-99.1988758&appid=$apiKey');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
