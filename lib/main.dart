import 'package:flutter/material.dart';
import 'package:bmi/widgets/Home.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A0E21),
          )),
      home: Home(),
    ));
