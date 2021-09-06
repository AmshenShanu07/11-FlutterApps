import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeCard extends StatelessWidget {
  HomeCard({this.child, required this.color, this.onPress});
  final child;
  final Color color;
  dynamic onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPress();
        },
        child: Container(
          child: child,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
