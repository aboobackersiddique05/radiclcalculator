import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getxController.dart';


class CalculatorScreen2 extends StatelessWidget {
  final CalculatorController calculatorController = Get.put(CalculatorController());

  Widget buildButton(String text, Color color, Function() onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Obx(() => Text(
                calculatorController.display.value,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            children: [
              buildButton("7", Colors.grey, () => calculatorController.inputNumber("7")),
              buildButton("8", Colors.grey, () => calculatorController.inputNumber("8")),
              buildButton("9", Colors.grey, () => calculatorController.inputNumber("9")),
              buildButton("/", Colors.orange, () => calculatorController.inputOperator("/")),
              buildButton("4", Colors.grey, () => calculatorController.inputNumber("4")),
              buildButton("5", Colors.grey, () => calculatorController.inputNumber("5")),
              buildButton("6", Colors.grey, () => calculatorController.inputNumber("6")),
              buildButton("*", Colors.orange, () => calculatorController.inputOperator("*")),
              buildButton("1", Colors.grey, () => calculatorController.inputNumber("1")),
              buildButton("2", Colors.grey, () => calculatorController.inputNumber("2")),
              buildButton("3", Colors.grey, () => calculatorController.inputNumber("3")),
              buildButton("-", Colors.orange, () => calculatorController.inputOperator("-")),
              buildButton("C", Colors.red, calculatorController.clear),
              buildButton("0", Colors.grey, () => calculatorController.inputNumber("0")),
              buildButton("=", Colors.orange, calculatorController.calculateResult),
              buildButton("+", Colors.orange, () => calculatorController.inputOperator("+")),
            ],
          ),
        ],
      ),
    );
  }
}
