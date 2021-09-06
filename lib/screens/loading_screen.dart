// import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';?
import 'package:http/http.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getWeather() async {
    await Geolocator.checkPermission();
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    String key = 'f13ce25f929a2cf93558a08b6b199bd5';
    var req = Client();
    var data = await req.get(
      Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$key&units=metric',
      ),
    );
    // print(data.body);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(weatherData: jsonDecode(data.body))));
  }

  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
        color: Colors.white70,
        size: 80,
      )),
    );
  }
}
