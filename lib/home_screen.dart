import 'package:flutter/material.dart';
import 'package:radicalcalc/provider/provider.dart';

import 'image_upload/imagepicker.dart';
import 'getx/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define the list of screens for each navigation item
  final List<Widget> _screens = [
    CalculatorScreen(),
    CalculatorScreen2(),
    UploadImage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _screens[_currentIndex], // Display the selected screen
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
            label: 'GetX',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Upload Image',
            icon: Icon(Icons.upload),
          ),
        ],
      ),
    );
  }
}
