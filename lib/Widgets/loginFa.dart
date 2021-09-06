import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaceBookLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.facebook_sharp,
          color: Colors.lightBlue[600],
        ),
        Text(
          'Login With Facebook',
          style: TextStyle(
            color: Colors.lightBlue[600],
          ),
        ),
      ],
    );
  }
}
