import 'package:flutter/material.dart';
import 'package:quize/questons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MaterialApp(home: Quizer()));

class Quizer extends StatefulWidget {
  const Quizer({Key? key}) : super(key: key);

  @override
  _QuizerState createState() => _QuizerState();
}

class _QuizerState extends State<Quizer> {
  Questions quizer = Questions();

  List<Icon> result = [];

  void onChoose(bool ans) {
    String checkResult = quizer.checkAnswer(ans);

    setState(() {
      if (checkResult == 'true') {
        result.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else if (checkResult == 'false') {
        result.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      } else if (checkResult == 'end') {
        // result.clear();S
        Alert(
            context: context,
            desc: 'Whoola!',
            content: Text('Let`s play again'),
            buttons: [
              DialogButton(
                child: Text('Play Again'),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    result.clear();
                  });
                  Navigator.pop(context);
                },
              ),
            ]).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Text(
                  quizer.nextQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  onChoose(true);
                },
                child: Text('True'),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  onChoose(false);
                },
                child: Text('False'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: result,
              ),
            )
          ],
        ),
      ),
    );
  }
}
