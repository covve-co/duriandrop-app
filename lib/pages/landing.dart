import 'package:flutter/material.dart';

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
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  child: new Image.asset('assets/images/facebook.png'),
                  color: new Color(0xFF3C5A99),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {},
                )),
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  child: new Image.asset('assets/images/google.png'),
                  color: new Color(0xFFFFFFFF),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {},
                )),
            _buildMarginWidget(
                EdgeInsets.all(10.0),
                new RaisedButton(
                  child: new Image.asset('assets/images/user.png'),
                  color: new Color(0xFFFFFFFF),
                  disabledColor: new Color(0xFFFFFFFF),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Map');
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
    padding: padding,
    child: child,
  );
}
