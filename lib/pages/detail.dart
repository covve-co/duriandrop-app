import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
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
    ;
  }
}

Widget _buildList() {
  return new ListView.builder(
    padding: const EdgeInsets.all(16.0),
  );
}
