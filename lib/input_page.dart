import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_new.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum gender { male, female }
gender selectedGender;
int height = 180;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Reusable_card(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.male;
                      //changeCardColour(selectedGender);
                    });
                  },
                  cardChild: new Icons_New(
                      iconImg: FontAwesomeIcons.mars, newText: 'MALE'),
                  colour: selectedGender == gender.male
                      ? reusableColor
                      : inActiveColor,
                ),
              ),
              Expanded(
                child: new Reusable_card(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.female;
                      //changeCardColour(selectedGender);
                    });
                  },
                  cardChild: new Icons_New(
                      iconImg: FontAwesomeIcons.venus, newText: 'FEMALE'),
                  colour: selectedGender == gender.female
                      ? reusableColor
                      : inActiveColor,
                ),
              ),
            ],
          )),
          Expanded(
            child: Reusable_card(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text('HEIGHT', style: labelTextStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: sliderTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ],
                ),
                colour: reusableColor),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable_card(
                    colour: reusableColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: sliderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              elevation: 6.0,
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              elevation: 6.0,
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new Reusable_card(
                    colour: reusableColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: sliderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              elevation: 6.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              shape: CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              elevation: 6.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new GestureWid(
            OnTap1: () {
              Calculator_brain calc =
                  new Calculator_brain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    bmiResult: calc.calculateBmi(),
                    interpretation: calc.InterpreTation(),
                    resultText: calc.getResults(),
                  ),
                ),
              );
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class GestureWid extends StatelessWidget {
  final Function OnTap1;
  final title;
  GestureWid({@required this.OnTap1, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap1,
      child: Container(
        child: Center(child: Text(title, style: largeTextSize)),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
