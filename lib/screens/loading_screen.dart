import 'dart:async';

import 'package:clima/services/weather.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'NoConnectionScreen.dart';
import 'location_screen.dart';

const apiKey = 'b89a435524b937671c520c3984b49c5e';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading-screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var _connectionStatus = 'Unknown';
  var connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        getLocationData();
        setState(() {});
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NoConnectionScreen();
        }));
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void getLocationData() async {
    WeatherModel weatherModel = new WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SpinKitPouringHourglass(
            color: Colors.white,
            size: 100.0,
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text('Getting Local Weather Data ...'),
            ),
          )
        ],
      ),
    );
  }
}
