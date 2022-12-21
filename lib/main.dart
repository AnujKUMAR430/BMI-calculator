import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'container.dart';
import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeColor = Color(0xff272A4E);
const inactiveColor = Color(0xff141A3C);
const sliderColor = Color(0xffFF0067);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF111531),
        ),
        scaffoldBackgroundColor: Color(0xFF111531),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Gender {
  male,
  female,
}

class _MyAppState extends State<MyApp> {
  var weight = 10;
  var age = 0;

  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  int height = 120;

  Gender selectedGender = Gender.male;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Reuse(
                      selectedGender == Gender.male ? activeColor : inactiveColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE', Colors.white,
                          Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Reuse(
                      selectedGender == Gender.female
                          ? activeColor
                          : inactiveColor,
                      IconContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                        Color(0xffBCBCCA),
                        Color(0xffBCBCCA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Reuse(
            Color(0xff141A3C),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: TextStyle(fontSize: 24.0, color: Color(0xffAAADC2)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      height.toString(),
                      style: TextStyle(fontSize: 46.0),
                    ),
                    Text(
                      'cm',
                      style:
                          TextStyle(fontSize: 26.0, color: Color(0xffAAADC2)),
                    ),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 100,
                  max: 250,
                  onChanged: (double newvalue) {
                    setState(() {
                      height = newvalue.round();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Reuse(
                    Color(0xff141A3C),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 24.0, color: Color(0xffAAADC2)),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                              fontSize: 46.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 10) weight--;
                                  });
                                },
                                elevation: 2.0,
                                fillColor: Color(0xff212747),
                                child: Icon(
                                  Icons.remove,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                elevation: 2.0,
                                fillColor: Color(0xff212747),
                                child: Icon(
                                  Icons.add,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                Reuse(
                    Color(0xff141A3C),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Color(0xffAAADC2),
                          ),
                        ),
                        Text(
                          '$age',
                          style: TextStyle(
                              fontSize: 46.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                },
                                elevation: 2.0,
                                fillColor: Color(0xff212747),
                                child: Icon(
                                  Icons.remove,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            ),
                            Expanded(
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                elevation: 2.0,
                                fillColor: Color(0xff212747),
                                child: Icon(
                                  Icons.add,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
            color: Color(0xffFF0067),
            child: Center(
                child: Text(
              'CALCULATE YOUR BMI',
              style: TextStyle(fontSize: 25.0),
            )),
          ),
        ],
      ),
    );
  }
}
