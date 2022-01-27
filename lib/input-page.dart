import 'dart:ui';
import 'package:bmi_calculator/result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'calculatorbrain.dart';

const activecardcolor = Color(0xFF1D1E33);
const inactivecardcolor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum ender { male, female }

class _InputPageState extends State<InputPage> {
  ender selectedgender;
  int hight = 180;
  int weight = 120;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI-CALCULATOR")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = ender.male;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedgender == ender.male
                          ? activecardcolor
                          : inactivecardcolor,
                      cardChild: ICON(
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = ender.female;
                    });
                  },
                  child: ReusableCard(
                      colour: selectedgender == ender.female
                          ? activecardcolor
                          : inactivecardcolor,
                      cardChild: ICON(
                        text: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      )),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: Color(0xFF1D1E33),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HIGHT"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      hight.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                    Text("cm"),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x29EB1555)),
                  child: Slider(
                      value: hight.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newvalue) {
                        setState(() {
                          hight = newvalue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(FontAwesomeIcons.minus),
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF111328),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(FontAwesomeIcons.plus),
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF111328),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(FontAwesomeIcons.minus),
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF111328),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: CircleAvatar(
                              radius: 25,
                              child: Icon(FontAwesomeIcons.plus),
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF111328),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: hight, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => result(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              child: Center(
                child: Text(
                  "CALCULATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

class ICON extends StatelessWidget {
  ICON({@required this.text, this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: ("poppins"),
              fontWeight: FontWeight.w100,
              letterSpacing: 1,
            ))
      ],
    );
  }
}
