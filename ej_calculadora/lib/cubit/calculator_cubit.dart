import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState());
/*
  void setConcatOperation(String value) {
    emit(CalculatorState(
      concatOperation: value,
      firstNumber: state.firstNumber,
      secondNumber: state.secondNumber,
      operation: state.operation,
      result: state.result,
    ));
  }
|
  void setFirstNumber(String value) {
    emit(CalculatorState(
      concatOperation: state.concatOperation,
      firstNumber: value,
      secondNumber: state.secondNumber,
      operation: state.operation,
      result: state.result,
    ));
  }

  void setSecondNumber(String value) {
    emit(CalculatorState(
      concatOperation: state.concatOperation,
      firstNumber: state.firstNumber,
      secondNumber: value,
      operation: state.operation,
      result: state.result,
    ));
  }

  void setOperation(String value) {
    emit(CalculatorState(
      concatOperation: state.concatOperation,
      firstNumber: state.firstNumber,
      secondNumber: state.secondNumber,
      operation: value,
      result: state.result,
    ));
  }
  */

  void getConcatOperation(String value) {
    if (value == 'AC') {
      // aqui borramos todo
      return;
    }

    if (value == 'DELETE') {
      // aqui borramos un caracter
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
