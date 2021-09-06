import 'package:flutter/material.dart';
import 'package:facebook/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Create extends StatelessWidget {
  const Create({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.grey,
                width: 0.15,
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/posts/2.jpeg'),
                radius: 17,
              ),
              SizedBox(
                width: 15,
              ),
              Text('What\'s on your mind?', style: kBoldText)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          margin: EdgeInsets.only(top: 5, bottom: 5),
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              CreateButtonGroup(
                icon: FontAwesomeIcons.video,
                lable: 'Live',
                color: Colors.red,
              ),
              VerticalDivider(
                width: 2,
                thickness: 0.50,
                color: Colors.grey,
              ),
              CreateButtonGroup(
                icon: FontAwesomeIcons.photoVideo,
                lable: 'Photo',
                color: Colors.green,
              ),
              VerticalDivider(
                width: 2,
                thickness: 0.50,
                color: Colors.grey,
              ),
              CreateButtonGroup(
                icon: FontAwesomeIcons.fileVideo,
                lable: 'Short Video',
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Divider(
          color: kColorGrey,
          height: 10,
          thickness: 10,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CreateButtonGroup extends StatelessWidget {
  CreateButtonGroup(
      {required this.color, required this.icon, required this.lable});

  IconData icon;
  Color color;
  String lable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          Text(
            lable,
            style: kBoldText,
          ),
        ],
      ),
    );
  }
}
