import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class GenderComponent extends StatelessWidget {
  GenderComponent({required this.lable, required this.icon});

  final String lable;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        Text(
          lable,
          style: kLableTextStyling,
        ),
      ],
    );
  }
}
