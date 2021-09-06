import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pswd = '';
  bool isAbled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'icon',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    enabled: isAbled,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kinputDecoration.copyWith(
                      hintText: 'Enter Your Email',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    enabled: isAbled,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      pswd = value;
                    },
                    decoration: kinputDecoration.copyWith(
                      hintText: 'Enter Your Password',
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    abled: isAbled,
                    color: Color(0xFFE57375),
                    lable: 'Log In',
                    onTap: () async {
                      print(email);
                      print(pswd);
                      final progress = ProgressHUD.of(context);
                      progress!.show();
                      setState(() {
                        isAbled = false;
                      });
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: pswd);
                        progress.dismiss();
                        setState(() {
                          isAbled = true;
                        });
                        Navigator.pushNamed(context, kChatScreen);
                      } catch (e) {
                        print(e);
                        progress.dismiss();
                        setState(() {
                          isAbled = true;
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
