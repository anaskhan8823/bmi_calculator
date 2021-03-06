import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'input-page.dart';
import 'calculatorbrain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          accentColor: Colors.purple,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
