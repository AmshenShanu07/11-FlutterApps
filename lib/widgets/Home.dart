import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/widgets/genderDetail.dart';
import 'package:bmi/widgets/HomeCard.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/widgets/RoundedButton.dart';
import 'package:bmi/widgets/Result.dart';
import 'BottomButton.dart';
import 'package:bmi/widgets/BMI_Calculator.dart';

enum Gender {
  male,
  female,
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedGender;
  int height = 160;
  int weight = 20;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              HomeCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male
                    ? kCardActiveColor
                    : kCardInActiveColor,
                child: GenderComponent(
                  lable: 'MALE',
                  icon: FontAwesomeIcons.mars,
                ),
              ),
              HomeCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female
                    ? kCardActiveColor
                    : kCardInActiveColor,
                child: GenderComponent(
                  lable: 'FEMALE',
                  icon: FontAwesomeIcons.venus,
                ),
              ),
            ],
          )),
          HomeCard(
              color: kCardActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLableTextStyling,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHighlightText,
                      ),
                      Text(
                        'cm',
                        style: kLableTextStyling,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: kHighlightPinkColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      overlayColor: Color(0x26EB1555),
                      trackHeight: 2.0,
                    ),
                    child: Slider(
                      onChanged: (val) {
                        setState(() {
                          height = val.round();
                        });
                      },
                      value: height.toDouble(),
                      max: 200,
                      min: 100,
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Row(
              children: [
                HomeCard(
                  color: kCardActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLableTextStyling,
                      ),
                      Text(
                        weight.toString(),
                        style: kHighlightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          RoundedButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                HomeCard(
                  color: kCardActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kLableTextStyling,
                      ),
                      Text(
                        age.toString(),
                        style: kHighlightText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          RoundedButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              lable: 'Calcualte',
              onPress: () {
                BmiBrain calc = BmiBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: calc.calculateBMI(),
                              status: calc.generalStatus(),
                              recomandation: calc.recomandation(),
                            )));
              })
        ],
      ),
    );
  }
}
