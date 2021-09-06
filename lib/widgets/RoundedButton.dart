import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.icon, required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      highlightColor: kCardActiveColor,
      shape: CircleBorder(),
      fillColor: kCardInActiveColor,
      onPressed: () {
        onPress();
      },
      constraints: BoxConstraints.tightFor(width: 56.0, height: 50.0),
      child: Icon(icon),
    );
  }
}
