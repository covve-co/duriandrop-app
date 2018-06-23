import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var dur = new Duration(seconds: 1, milliseconds: 50);
    return new Timer(dur, redirectLanding);
  }

  void redirectLanding() {
    Navigator.of(context).pushReplacementNamed('/Map');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width: 128.0,
              height: 128.0,
              child: Image.asset("assets/images/logo.png"),
            ),
            new Container(
              padding: EdgeInsets.all(24.0),
              child: new Center(
                child: Text(
                  "DurianDrop",
                  style: new TextStyle(fontSize: 32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
