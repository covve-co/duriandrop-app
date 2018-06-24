import 'package:flutter/material.dart';
import './map.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Hero(
              tag: 'logo',
              child: new Container(
                width: 200.0,
                height: 200.0,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(bottom: 100.0),
              child: new Column(
                children: <Widget>[
                  Text("DurianDrop",
                      style: new TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold)),
                  Text("For the love of durians.",
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).accentColor)),
                ],
              ),
            ),
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Image.asset('assets/images/facebook.png'),
                  color: new Color(0xFF3C5A99),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {},
                )),
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Image.asset('assets/images/google.png'),
                  color: new Color(0xFFFFFFFF),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {},
                )),
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Image.asset('assets/images/user.png'),
                  color: new Color(0xFFFFFFFF),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/Map");
                  },
                )),
          ],
        ),
      ),
    );
  }
}

Widget _buildMarginWidget(EdgeInsetsGeometry padding, Widget child) {
  return new Container(
    width: 189.0,
    height: 70.5,
    padding: padding,
    child: child,
  );
}
