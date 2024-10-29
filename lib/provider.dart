import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int _currentIndex = 0;

  Widget roundButton(String buttonText, CalculatorProvider calculatorProvider) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ClipOval(
          child: Material(
            color: Colors.orange,
            child: InkWell(
              onTap: () {
                calculatorProvider.operations(buttonText);
              },
              child: SizedBox(
                width: 70,
                height: 60,
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              calculatorProvider.output,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  roundButton('7', calculatorProvider),
                  roundButton('8', calculatorProvider),
                  roundButton('9', calculatorProvider),
                  roundButton('/', calculatorProvider),
                ],
              ),
              Row(
                children: [
                  roundButton('4', calculatorProvider),
                  roundButton('5', calculatorProvider),
                  roundButton('6', calculatorProvider),
                  roundButton('*', calculatorProvider),
                ],
              ),
              Row(
                children: [
                  roundButton('1', calculatorProvider),
                  roundButton('2', calculatorProvider),
                  roundButton('3', calculatorProvider),
                  roundButton('-', calculatorProvider),
                ],
              ),
              Row(
                children: [
                  roundButton('.', calculatorProvider),
                  roundButton('0', calculatorProvider),
                  roundButton('00', calculatorProvider),
                  roundButton('+', calculatorProvider),
                ],
              ),
              Row(
                children: [
                  roundButton('CLEAR', calculatorProvider),
                  roundButton('=', calculatorProvider),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Provider',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Getx',
            icon: Icon(Icons.gamepad_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Upload',
            icon: Icon(Icons.image),
          ),
        ],
      ),
    );
  }
}
