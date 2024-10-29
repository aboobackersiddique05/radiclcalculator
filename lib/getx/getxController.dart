import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var display = '0'.obs;
  var num1 = 0.0;
  var num2 = 0.0;
  var operator = '';

  void inputNumber(String number) {
    if (display.value == '0') {
      display.value = number;
    } else {
      display.value += number;
    }
  }

  void inputOperator(String op) {
    num1 = double.parse(display.value);
    operator = op;
    display.value = '';
  }

  void calculateResult() {
    num2 = double.parse(display.value);
    switch (operator) {
      case '+':
        display.value = (num1 + num2).toString();
        break;
      case '-':
        display.value = (num1 - num2).toString();
        break;
      case '*':
        display.value = (num1 * num2).toString();
        break;
      case '/':
        display.value = num2 != 0 ? (num1 / num2).toString() : 'Error';
        break;
    }
    num1 = 0.0;
    num2 = 0.0;
    operator = '';
  }

  void clear() {
    display.value = '0';
    num1 = 0.0;
    num2 = 0.0;
    operator = '';
  }
}
