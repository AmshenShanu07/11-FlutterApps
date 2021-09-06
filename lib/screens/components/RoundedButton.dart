import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.color,
      required this.lable,
      required this.onTap,
      this.abled = true});

  bool abled = true;
  final Color color;
  final String lable;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: abled ? color : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: abled == false
              ? null
              : () {
                  onTap();
                },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            lable,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
