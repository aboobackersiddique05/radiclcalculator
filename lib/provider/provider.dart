import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radicalcalc/provider/provider_controller.dart';

// Main Calculator Provider Class


// Provider Screen
class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {


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
      // appBar: AppBar(
      //   title: Text('Calculator'),
      //   backgroundColor: Colors.blue,
      // ),
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

    );
  }
}
