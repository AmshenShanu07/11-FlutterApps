import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Topheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 150,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                shape: CircleBorder(),
                constraints: BoxConstraints(
                  minWidth: 10,
                ),
                elevation: 0.0,
                fillColor: Colors.grey[300],
                padding: EdgeInsets.all(9),
                onPressed: () {},
                child: Icon(
                  FontAwesomeIcons.search,
                  size: 20,
                ),
              ),
              RawMaterialButton(
                shape: CircleBorder(),
                constraints: BoxConstraints(
                  minWidth: 15,
                ),
                elevation: 0.0,
                fillColor: Colors.grey[300],
                padding: EdgeInsets.all(9),
                onPressed: () {},
                child: Icon(
                  FontAwesomeIcons.facebookMessenger,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.grey,
            width: 0.15,
          ),
        ),
      ),
    );
  }
}
