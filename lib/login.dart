import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radicalcalc/HomeScreen.dart';
import 'package:radicalcalc/calculatorcontroller.dart';
import 'package:radicalcalc/imagepicker.dart';
import 'package:radicalcalc/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final CalculatorController calculatorController = Get.put(CalculatorController());
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CalculatorScreen(), 
    Login(),       
    UploadImage()       
  ];

  Widget roundButton(String buttonText) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ClipOval(
          child: Material(
            color: Colors.orange,
            child: InkWell(
              onTap: () {
                calculatorController.operations(buttonText);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: PageController(initialPage: _currentIndex),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
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
            icon: Icon(Icons.calculate),
          ),
          BottomNavigationBarItem(
            label: 'Getx',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Upload',
            icon: Icon(Icons.upload),
          ),
        ],
      ),
    );
  }
}
