import 'package:flutter/material.dart';
import 'HomeCard.dart';
import 'package:bmi/constants.dart';
import 'BottomButton.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.status,
    required this.bmi,
    required this.recomandation,
  });

  final String status;
  final String bmi;
  final String recomandation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeCard(
              color: kCardActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status.toUpperCase(),
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 60.0),
                  ),
                  Text(
                    recomandation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              lable: 'Re-Calculate',
              onPress: () {
                Navigator.of(context).pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
