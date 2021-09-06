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
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isImage = false;
  int magiBall = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magic Ball'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: isImage
            ? TextButton(
                onPressed: () {
                  setState(() {
                    magiBall = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset(
                  'images/ball$magiBall.png',
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  setState(() {
                    magiBall = Random().nextInt(5) + 1;
                    isImage = true;
                  });
                },
                child: Text(
                  'Press Here\n To Make a Decision',
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
