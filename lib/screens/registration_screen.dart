import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email = '';
  String password = '';
  bool disabled = true;
  var _auth = FirebaseAuth.instance;

  void signup(BuildContext context) async {
    print(email);
    print(password);
    final progress = ProgressHUD.of(context);
    progress!.show();
    setState(() {
      disabled = false;
    });

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      setState(() {
        disabled = true;
      });
      Navigator.pushNamed(context, kChatScreen);
    } catch (e) {
      setState(() {
        disabled = true;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        barrierEnabled: false,
        child: Builder(
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
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
                    enabled: disabled,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kinputDecoration.copyWith(
                      hintText: 'Enter Email',
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    enabled: disabled,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kinputDecoration.copyWith(
                      hintText: 'Enter Passward',
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    color: Color(0xFFE57375),
                    lable: 'Register',
                    abled: disabled,
                    onTap: () {
                      signup(context);
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
// amshen@gmail.com
// amshen07