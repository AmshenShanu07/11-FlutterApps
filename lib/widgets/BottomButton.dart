import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.lable, required this.onPress});

  final String lable;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.99,
      height: 60,
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Text(
          lable,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        style: TextButton.styleFrom(
          backgroundColor: kHighlightPinkColor,
        ),
      ),
    );
  }
}
