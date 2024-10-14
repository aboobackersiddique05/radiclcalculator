import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var output = '0'.obs;
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  void operations(String values) {
    if (values == 'CLEAR') {
      output.value = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';

    } else if (values == '+' || values == '-' || values == '*' || values == '/') {
      num1 = double.parse(output.value);
      operand = values;
      output.value = '0';

    } else if (values == '.') {
      if (output.value.contains('.')) {
        print('Already contains decimals');
        return;
      } else {
        output.value += values;
      }

    } else if (values == '=') {
      num2 = double.parse(output.value);
      if (operand == '+') {
        output.value = (num1 + num2).toString();
      }

      if (operand == '-') {
        output.value = (num1 - num2).toString();
      }

      if (operand == '*') {
        output.value = (num1 * num2).toString();
      }

      if (operand == '/') {
        output.value = (num1 / num2).toString();
      }
      
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      output.value = output.value == '0' ? values : output.value + values;
    }
  }
}
