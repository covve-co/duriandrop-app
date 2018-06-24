import 'package:flutter/material.dart';
import '../database/seller.dart';
import '../database/drop.dart';

class DropPage extends StatelessWidget {
  final Drop drop;
  DropPage(this.drop);

  @override
  Widget build(BuildContext context) {
    final _titleStyle = new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 28.0,
    );

    return Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: new Hero(
            tag: "slab-${drop.id}",
            child: new Container(
                alignment: Alignment(0.0, 0.0),
                color: Theme.of(context).primaryColor,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top: 40.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Hero(
                        tag: "ico${drop.id}",
                        child: new Container(
                          height: 240.0,
                          width: 160.0,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(50.0),
                        child: Text(
                            "${drop.type} going at \$${drop.price.toStringAsFixed(2)} per serving!",
                            textAlign: TextAlign.center,
                            style: _titleStyle)),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        width: 189.0,
                        height: 70.5,
                        child: new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text("Pledge Now.",
                              style:
                                  new TextStyle(fontWeight: FontWeight.w700)),
                          color: Theme.of(context).accentColor,
                          disabledColor: new Color(0xFFFFFFFF),
                          onPressed: () {
                            //
                          },
                        ))
                  ],
                ))));
  }
}
