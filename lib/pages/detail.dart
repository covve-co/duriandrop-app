import 'package:flutter/material.dart';
import '../database/seller.dart';
import '../database/listing.dart';
import '../database/review.dart';
import '../database/drop.dart';
import 'package:flutter_map/flutter_map.dart';

class DetailPage extends StatelessWidget {
  final Seller seller;
  DetailPage(this.seller);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          title: new Container(
              child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
              width: 60.0,
              height: 60.0,
              padding: EdgeInsets.all(8.0),
              child: new Image.asset('assets/images/durian-badge.png')),
          new Container(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                new Text(
                  this.seller.name,
                  style: new TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                new Container(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildStars(context, this.seller.rating()),
                  ),
                ),
              ]))
        ],
      ))),
      body: _buildLists(context, seller),
    );
  }

  Widget _buildLists(BuildContext context, Seller seller) {
    return new ListView.builder(
      padding: EdgeInsets.only(bottom: 20.0),
      itemCount: (1 +
                  seller.listings.length +
                  seller.reviews.length +
                  seller.drops.length) *
              2 -
          1,
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider(color: Theme.of(context).primaryColor);
        final index = i ~/ 2;
        var offset = 0;
        if (index == 0) {
          return _buildMapDetail(seller);
        }
        offset += 1;
        if (index - offset <= seller.listings.length) {
          return _buildListing(context, seller.listings[index - offset]);
        }
        offset += seller.listings.length;
        if (index - offset <= seller.reviews.length) {
          return _buildReview(context, seller.reviews[index - offset]);
        }
        offset += seller.reviews.length;
        if (index - offset <= seller.drops.length) {
          return _buildDrop(context, seller.drops[index - offset]);
        }
      },
    );
  }

  Widget _buildMapDetail(Seller seller) {
    final _addressStyle =
        new TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
    return new Container(
      child: new Column(children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(15.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(Icons.location_on, color: Colors.red),
              new Text(seller.address, style: _addressStyle),
            ],
          ),
        ),
        new Container(
            height: 350.0,
            child: new FlutterMap(
              options: new MapOptions(
                center: seller.location,
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
                  markers: [
                    new Marker(
                      width: 32.0,
                      height: 32.0,
                      point: seller.location,
                      builder: (ctx) => new Container(
                            child:
                                new Image.asset('assets/images/map-icon.png'),
                          ),
                    ),
                  ],
                )
              ],
            ))
      ]),
    );
  }

  Widget _buildReview(BuildContext context, Review review) {
    return new Container(
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Column(children: <Widget>[
              new Row(children: <Widget>[
                new Container(
                  width: 190.0,
                  child: new Column(children: [
                    Text(
                      review.username(),
                      textAlign: TextAlign.left,
                      style: new TextStyle(color: Colors.black),
                    ),
                    Text(
                      review.description,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    )
                  ]),
                ),
                new Container(
                  width: 125.0,
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildStars(context, this.seller.rating()),
                  ),
                ),
              ])
            ])
          ]),
    );
  }

  Widget _buildListing(BuildContext context, Listing listing) {
    final _titleStyle = new TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w700,
      fontSize: 28.0,
    );
    final _priceStyle = new TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 25.0,
    );
    final _descStyle = new TextStyle(
        color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.0);
    final _price = listing.price.toStringAsFixed(2);
    return new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(child: new Image.asset(listing.image)),
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Text("~\$$_price\/kg", style: _priceStyle),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Text(listing.type, style: _titleStyle),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: new Text(listing.type, style: _descStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropTitle(BuildContext context) {
    return new Container(
      color: Theme.of(context).primaryColor,
      child: new Row(
        children: <Widget>[
          new Container(
            child: new Image.asset('assets/images/l'),
          )
        ],
      ),
    );
  }

  Widget _buildDrop(BuildContext context, Drop drop) {
    return new Container(
      color: Theme.of(context).primaryColor,
      child: new Column(children: [
        new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                border: new Border.all(
                  color: Theme.of(context).primaryColor,
                )),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                new Flexible(
                  fit: FlexFit.loose,
                  child: new Text(
                    drop.type + "@ \$" + drop.price.toStringAsFixed(2) + "KG",
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(24.0),
                  child: new Text(drop.deadline.toString() + " Days Remaining"),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            )),
        new Container(
          padding: EdgeInsets.all(16.0),
        )
      ]),
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