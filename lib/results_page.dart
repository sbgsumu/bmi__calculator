import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
 ResultsPage({@required this.result,@required this.comments,@required this.bmi});

  final String result , comments ,bmi ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Your Result ",
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActive_cardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: kResultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        comments,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight : FontWeight.bold,
                            ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonText: "RE - CALCULATE",
            ),
          ],
        ));
  }
}
