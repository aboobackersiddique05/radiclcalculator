import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radicalcalc/provider/provider.dart';
import 'package:radicalcalc/provider/provider_controller.dart';

import 'home_screen.dart'; // Assuming CalculatorScreen is defined here

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CalculatorProvider()),
          ],
       child: MyApp(

  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(), // Set CalculatorScreen as the home widget
    );
  }
}
