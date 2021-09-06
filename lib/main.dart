import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/constants.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: kWelcomeScreen,
      routes: {
        kWelcomeScreen: (context) => WelcomeScreen(),
        kLoginScreen: (context) => LoginScreen(),
        kSignUpScreen: (context) => RegistrationScreen(),
        kChatScreen: (context) => ChatScreen(),
      },
    );
  }
}
