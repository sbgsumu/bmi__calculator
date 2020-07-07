import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum gender { Male, Female }

class _InputPageState extends State<InputPage> {
  Color malecardColour = kInactive_cardColour;
  Color femalecardColor = kInactive_cardColour;
  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = gender.Male;
                    });
                  },
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = gender.Male;
                      });
                    },
                    colour: selectedGender == gender.Male
                        ? kActive_cardColour
                        : kInactive_cardColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: "MALE"),
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = gender.Female;
                    });
                  },
                  colour: selectedGender == gender.Female
                      ? kActive_cardColour
                      : kInactive_cardColour,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: "FEMALE"),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kActive_cardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$height',
                      style: kShowTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xff8D8E98),
                    thumbColor: Color(0xffEb1555),
                    overlayColor: Color(0x1fEb1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayShape: (RoundSliderOverlayShape(
                      overlayRadius: 30.0,
                    )),
                  ),
                  child: Slider(
                      min: 100.0,
                      max: 220.0,
                      value: height.roundToDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: kActive_cardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        "$weight",
                        style: kShowTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )), //Weight Card
                Expanded(
                    child: ReusableCard(
                  colour: kActive_cardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text("$age", style: kShowTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Brain bn = Brain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(

                        bmi: bn.bmiCalculate(),
                            result: bn.getResult(),
                            comments: bn.getComments(),
                          )));
            },
            buttonText: "CALCULATE",
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5e),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      elevation: 6.0,
      onPressed: onPressed,
    );
  }
}
