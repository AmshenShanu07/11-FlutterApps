import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  int leftDice = 1;
  int rightDice = 1;

  void rollTheDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Its Your Turn',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  rollTheDice();
                },
                child: Image.asset('images/dice$leftDice.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  rollTheDice();
                },
                child: Image.asset('images/dice$rightDice.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
