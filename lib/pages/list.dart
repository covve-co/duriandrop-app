import 'package:flutter/material.dart';
import 'map.dart';
import '../database/database.dart';
import '../database/seller.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(new PageRouteBuilder(
              opaque: true,
              pageBuilder: (BuildContext context, _, __) {
                return new MapPage();
              },
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }));
        },
        child: new Icon(Icons.map, color: Theme.of(context).primaryColor),
      ),
      appBar: new AppBar(
          title: new Container(
              child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
              width: 48.0,
              height: 48.0,
              padding: EdgeInsets.all(8.0),
              child: new Image.asset('assets/images/logo.png')),
          new Text(
            "DurianDrop",
            style: new TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          )
        ],
      ))),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    final sellers = Database.sellers;
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: sellers.length,
      itemBuilder: (context, i) {
        // if (i.isOdd) return new Divider(color: Theme.of(context).primaryColor);
        // final index = i ~/ 2;
        return _buildRow(sellers[i]);
      },
    );
  }

  Widget _buildRow(Seller seller) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(child: new Image.asset(seller.image)),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(seller.name),
              // new Text("$rating"),
            ],
          )
        ],
      ),
    );
  }
}
