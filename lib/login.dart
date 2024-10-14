import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radicalcalc/calculatorcontroller.dart';


class Login extends StatelessWidget {
  final CalculatorController calculatorController = Get.put(CalculatorController());

  Widget button(String buttontext) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          buttontext,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          calculatorController.operations(buttontext);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            child: Obx(() => Text(
              calculatorController.output.value,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )),
          ),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  button('7'),
                  button('8'),
                  button('9'),
                  button('/')
                ],
              ),
              Row(
                children: [
                  button('4'),
                  button('5'),
                  button('6'),
                  button('*')
                ],
              ),
              Row(
                children: [
                  button('1'),
                  button('2'),
                  button('3'),
                  button('-')
                ],
              ),
              Row(
                children: [
                  button('.'),
                  button('0'),
                  button('00'),
                  button('+')
                ],
              ),
              Row(
                children: [
                  button('CLEAR'),
                  button('='),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}