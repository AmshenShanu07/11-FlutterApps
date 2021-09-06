import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(home: SafeArea(child: Xylophone())));

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  Widget xyloButton({color: Color, noteNumber: int}) {
    return Expanded(
      child: TextButton(
          onPressed: () {
            AudioCache().play('note$noteNumber.wav');
          },
          child: SizedBox(),
          style: TextButton.styleFrom(
            backgroundColor: color,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        xyloButton(color: Colors.red, noteNumber: 1),
        xyloButton(color: Colors.orange, noteNumber: 2),
        xyloButton(color: Colors.yellow, noteNumber: 3),
        xyloButton(color: Colors.green, noteNumber: 4),
        xyloButton(color: Colors.teal, noteNumber: 5),
        xyloButton(color: Colors.blue, noteNumber: 6),
        xyloButton(color: Colors.purple, noteNumber: 7),
      ],
    );
  }
}
