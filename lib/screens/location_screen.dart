import 'package:clima/screens/city_screen.dart';
// import 'package:clima/screens/loading_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

// ignore: must_be_immutable
class LocationScreen extends StatefulWidget {
  LocationScreen({required this.weatherData});
  var weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temp = 0;

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
    setState(() {
      widget.weatherData = jsonDecode(data.body);
      temp = widget.weatherData['main']['temp'].toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    temp = widget.weatherData['main']['temp'].toInt();
    String emoje =
        weather.getWeatherIcon(widget.weatherData['weather'][0]['id']);
    String desc = weather.getMessage(temp);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      getWeather();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityname = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));

                      if (cityname != '') {
                        print(cityname);
                        String url =
                            'http://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=f13ce25f929a2cf93558a08b6b199bd5&units=metric';
                        Client req = Client();
                        var weatherData = await req.get(Uri.parse(url));
                        setState(() {
                          widget.weatherData = jsonDecode(weatherData.body);
                          temp = widget.weatherData['main']['temp'].toInt();
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      emoje,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$desc in ${widget.weatherData['name']}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
