import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState());

  void getConcatOperation(String value) {
    if (value == 'AC') {
      emit(CalculatorState());
      return;
    }

    if (value == 'DELETE') {
      if (state.operation.isEmpty) {
        emit(CalculatorState(
          firstNumber:
              state.firstNumber.substring(0, state.firstNumber.length - 1),
          concatOperation: state.concatOperation
              .substring(0, state.concatOperation.length - 1),
          operation: state.operation,
          secondNumber: state.secondNumber,
          result: state.result,
        ));
        return;
      }
      if (state.operation.isNotEmpty && state.secondNumber.isNotEmpty) {
        emit(CalculatorState(
          secondNumber:
              state.secondNumber.substring(0, state.secondNumber.length - 1),
          concatOperation: state.concatOperation
              .substring(0, state.concatOperation.length - 1),
          operation: state.operation,
          firstNumber: state.firstNumber,
          result: state.result,
        ));
        return;
      }
      if (state.operation.isNotEmpty) {
        emit(CalculatorState(
          concatOperation: state.concatOperation
              .substring(0, state.concatOperation.length - 1),
          firstNumber: state.firstNumber,
          result: state.result,
        ));
        return;
      }
      return;
    }

    if (['+', '-', '/', 'X'].contains(value)) {
      emit(CalculatorState(
        operation: value,
        concatOperation: state.concatOperation + value,
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        result: state.result,
      ));
      return;
    }

    if (state.operation.isEmpty) {
      emit(CalculatorState(
        firstNumber: state.firstNumber + value,
        concatOperation: state.concatOperation + value,
        operation: state.operation,
        secondNumber: state.secondNumber,
        result: state.result,
      ));
    } else {
      emit(CalculatorState(
        secondNumber: state.secondNumber + value,
        concatOperation: state.concatOperation + value,
        operation: state.operation,
        firstNumber: state.firstNumber,
        result: state.result,
      ));
    }
  }

  void calculateResult() {
    if (state.firstNumber.isEmpty ||
        state.secondNumber.isEmpty ||
        state.operation.isEmpty) {
      emit(CalculatorState(
        concatOperation: state.concatOperation,
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        operation: state.operation,
        result: 'Operación no válida',
      ));
      return;
    }

    final List<String> resultList =
        state.concatOperation.split(state.operation);

    final double first = double.parse(resultList[0]);
    final double second = double.parse(resultList[1]);

    String result = '';

    switch (state.operation) {
      case '+':
        result = '${first + second}';
        break;
      case '-':
        result = '${first - second}';
        break;
      case '/':
        result = (first / second).toStringAsFixed(4);
        break;
      case 'X':
        result = (first * second).toStringAsFixed(4);
        break;
      default:
        result = 'Operación no válida';
        break;
    }

    emit(CalculatorState(
      concatOperation: state.concatOperation,
      firstNumber: state.firstNumber,
      secondNumber: state.secondNumber,
      operation: state.operation,
      result: result,
    ));
  }
}

class CalculatorState {
  CalculatorState({
    String? firstNumber,
    String? secondNumber,
    String? operation,
    String? concatOperation,
    String? result,
  })  : firstNumber = firstNumber ?? '',
        secondNumber = secondNumber ?? '',
        operation = operation ?? '',
        concatOperation = concatOperation ?? '',
        result = result ?? '';

  String firstNumber;
  String secondNumber;
  String operation;
  String concatOperation;
  String result;
}
