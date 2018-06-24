import 'package:flutter/material.dart';
import 'list.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';
import '../database/database.dart';
import './detail.dart';

class MapPage extends StatelessWidget {
  var sellers = Database.sellers;
  var markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    var location = new LatLng(1.312576, 103.864188);
    markers.add(new Marker(
      width: 32.0,
      height: 32.0,
      point: location,
      builder: (ctx) => new Icon(
            Icons.location_on,
            color: Colors.red,
          ),
    ));
    for (var i in sellers) {
      markers.add(new Marker(
          width: 32.0,
          height: 32.0,
          point: i.location,
          builder: (ctx) => new GestureDetector(
                onTap: () {
                  Navigator.of(ctx).push(new MaterialPageRoute(
                      builder: (ctx) => new DetailPage(i)));
                },
                child: new Container(
                  child: new Image.asset('assets/images/map-icon.png'),
                ),
              )));
    }
    return new Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(new PageRouteBuilder(
                opaque: true,
                pageBuilder: (BuildContext context, _, __) {
                  return new ListPage();
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
          child: new Icon(Icons.list, color: Theme.of(context).primaryColor),
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
                ),
              ],
            ))),
        body: new Center(
            child: new Hero(
          tag: "map",
          child: new FlutterMap(
            options: new MapOptions(
              center: location,
              zoom: 15.0,
            ),
            layers: [
              new TileLayerOptions(
                urlTemplate: "https://api.tiles.mapbox.com/v4/"
                    "{id}/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoiY292dmVvcHMiLCJhIjoiY2ppcmJra2dvMWttMjNqcmZ5bGN5NjdwMiJ9.peIQQbrFTXdgvdnriIgBdw",
                additionalOptions: {
                  'accessToken':
                      '<pk.eyJ1IjoiY292dmVvcHMiLCJhIjoiY2ppcmJra2dvMWttMjNqcmZ5bGN5NjdwMiJ9.peIQQbrFTXdgvdnriIgBdw>',
                  'id': 'mapbox.streets',
                },
              ),
              new MarkerLayerOptions(
                markers: markers,
              ),
            ],
          ),
        )));
  }
}
