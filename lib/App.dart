import 'package:flutter/material.dart';
import 'package:instagram_login/Widgets/Inputfield.dart';
import 'package:instagram_login/Widgets/Title.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Login',
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleWidget(),
                InputContainer(),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have a account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue[400]),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
