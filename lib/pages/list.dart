import 'package:flutter/material.dart';
import 'map.dart';
import '../database/database.dart';
import '../database/seller.dart';
import './detail.dart';

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
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.shopping_basket, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushNamed('/Order');
              },
            )
          ],
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
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    final sellers = Database.sellers;
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: sellers.length * 2 - 1,
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider(color: Theme.of(context).primaryColor);
        final index = i ~/ 2;
        return _buildRow(context, sellers[index]);
      },
    );
  }

  Widget _buildRow(BuildContext context, Seller seller) {
    final _titleStyle = new TextStyle(color: Theme.of(context).primaryColor);
    final _addressStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new DetailPage(seller)));
      },
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Hero(
              tag: "icon${seller.id}",
              child: new Container(child: new Image.asset(seller.image))),
          new Flexible(
              child: new Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Text(seller.name, style: _titleStyle),
                ),
                new Flexible(
                    child: new Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: new Row(
                          children: <Widget>[
                            new Icon(Icons.location_on, color: Colors.red),
                            new Text(
                              seller.address,
                              style: _addressStyle,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ))),
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Row(
                    children: _buildStars(context, seller.rating()),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  List<Widget> _buildStars(BuildContext context, num rating) {
    var stars = <Widget>[];

    var i;
    for (i = 0; i < rating.floor(); i++) {
      stars.add(new Container(
        width: 25.0,
        height: 25.0,
        child: new Image.asset("assets/images/star-full.png"),
      ));
    }

    if (rating - i > 0.0) {
      stars.add(new Container(
        width: 25.0,
        height: 25.0,
        child: new Image.asset("assets/images/star-half.png"),
      ));
    }

    for (var j = 0; j < 5 - i; j++) {
      stars.add(new Container(
        width: 25.0,
        height: 25.0,
        child: new Image.asset("assets/images/star-empty.png"),
      ));
    }

    return stars;
  }
}
