import 'package:flutter/material.dart';

class ForgotPsws extends StatelessWidget {
  handleChange(bool value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
              ),
            ),
            Text(
              'Show Password',
              style: TextStyle(color: Colors.grey[350]),
            )
          ],
        ),
        Text(
          'Forgot password?',
          style: TextStyle(
            color: Colors.lightBlue,
          ),
        ),
      ],
    );
  }
}
