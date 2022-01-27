import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'input-page.dart';
import 'main.dart';
import 'calculatorbrain.dart';

class result extends StatelessWidget {
  result(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI-CALCULATOR")),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Text(
                  "Your Results",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(resultText.toString(),
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontFamily: 'Poppins'))),
                  Center(
                    child: Text(
                      bmiResult.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 80, fontFamily: 'Poppins'),
                    ),
                  ),
                  Center(child: Text(interpretation.toString())),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, "mainpage");
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                    fontSize: 35,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.pink),
            ),
          )
        ],
      ),
    );
  }
}
