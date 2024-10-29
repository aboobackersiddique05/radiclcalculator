import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  String _output = '0';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = '';

  String get output => _output;

  void operations(String values) {
    if (values == 'CLEAR') {
      _output = '0';
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else if (values == '+' || values == '-' || values == '*' || values == '/') {
      _num1 = double.parse(_output);
      _operand = values;
      _output = '0';
    } else if (values == '.') {
      if (_output.contains('.')) {
        print('Already contains decimals');
        return;
      } else {
        _output += values;
      }
    } else if (values == '=') {
      _num2 = double.parse(_output);
      switch (_operand) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '*':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          _output = (_num2 != 0) ? (_num1 / _num2).toString() : 'Error';  
          break;
      }
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else {
      _output = _output == '0' ? values : _output + values;
    }
    notifyListeners();  
  }
}
