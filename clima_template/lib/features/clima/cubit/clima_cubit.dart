import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clima_cubit.freezed.dart';
part 'clima_state.dart';

class ClimaCubit extends Cubit<ClimaState> {
  ClimaCubit() : super(ClimaState());
}
