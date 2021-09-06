import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String main = '';
  String dec = '';
  void getloc() async {
    await Geolocator.checkPermission();
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    String key = 'f13ce25f929a2cf93558a08b6b199bd5';
    var req = Client();
    var data = await req.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$key'));
    // print();
    setState(() {
      main = jsonDecode(data.body)['weather'][0]['main'];
      main = jsonDecode(data.body)['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(main),
            Text(dec),
            ElevatedButton(
              onPressed: getloc,
              child: Text('click'),
            ),
          ],
        ),
      ),
    );
  }
}
