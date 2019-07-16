import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class Results extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  Results(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAlCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'YOUR RESULT',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable_card(
              colour: reusableColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: titleTextStyle),
                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretation.toUpperCase(),
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          new GestureWid(
              OnTap1: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InputPage()));
              },
              title: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
