import 'package:flutter/material.dart';
import './pages/detail.dart';
import './pages/landing.dart';
import './pages/map.dart';
import './pages/splash.dart';
import './pages/list.dart';

void main() => runApp(new App());

final white = Colors.white;
final green = new Color.fromARGB(255, 102, 187, 106);
final brown = new Color.fromARGB(255, 141, 110, 99);
final yellow = new Color.fromARGB(255, 255, 241, 118);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleFont = const TextStyle(fontSize: 32.0, color: Colors.white);
    return new MaterialApp(
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/Map': (BuildContext context) => new MapPage(),
        '/Splash': (BuildContext context) => new SplashPage(),
        '/Landing': (BuildContext context) => new LandingPage(),
        '/Detail': (BuildContext context) => new DetailPage(),
        '/List': (BuildContext context) => new ListPage(),
      },
      theme: new ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: white,
        primaryColor: green,
        accentColor: yellow,
        errorColor: new Color.fromARGB(255, 234, 82, 111),
        textTheme: new TextTheme(
          body1: new TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
          body2: titleFont,
        ),
      ),
    );
  }
}
