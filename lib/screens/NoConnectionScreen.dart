import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('images/noInternet.png'),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'No Internet Connection Found',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
