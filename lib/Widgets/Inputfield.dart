import 'package:flutter/material.dart';
import 'package:instagram_login/Widgets/ForgotPswd.dart';
import 'package:instagram_login/Widgets/loginFa.dart';

class InputContainer extends StatefulWidget {
  @override
  _InputContainer createState() => _InputContainer();
}

class _InputContainer extends State<InputContainer> {
  String username = '';
  String pswd = '';

  Widget InputField({hint: String, type: bool}) {
    return TextField(
      obscureText: false,
      enableSuggestions: type,
      autocorrect: type,
      onChanged: (text) {
        print(text);
      },
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[800],
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.white70,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(
          top: 20, bottom: MediaQuery.of(context).size.height * .15),
      height: MediaQuery.of(context).size.height * .45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InputField(
            hint: 'Phone number, username or email',
            type: true,
          ),
          InputField(hint: 'Password', type: false),
          ForgotPsws(),
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.42,
                right: MediaQuery.of(context).size.width * 0.42,
                top: 15,
                bottom: 15,
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          FaceBookLogin(),
        ],
      ),
    );
  }
}
