import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Instagram',
        style: TextStyle(
            fontFamily: 'BillBong', fontSize: 50, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
