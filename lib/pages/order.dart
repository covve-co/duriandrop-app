import 'package:flutter/material.dart';
import '../database/order.dart';
import '../database/database.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Order",
          style:
              new TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
      ),
      body: new Orders(),
    );
  }
}

class Orders extends StatefulWidget {
  @override
  createState() => new OrdersState();
}

class OrdersState extends State<Orders> {
  var currOrders = Database.orders;
  @override
  Widget build(BuildContext context) {
    return _buildOrders();
  }

  Widget _buildOrders() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: currOrders.length,
      itemBuilder: (context, i) {
        return _buildRow(currOrders[i]);
      },
    );
  }

  Widget _buildRow(Order order) {
    return new Column(children: [
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
                  order.amount.toString() + "KG " + order.listing.type,
                  style: new TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              new Container(
                padding: EdgeInsets.all(24.0),
              ),
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(16.0)),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: new Text(order.deliveryStatus,
                        style: new TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600)),
                  ),
                  new Column(children: [
                    new IconButton(
                        icon: new Icon(
                      Icons.local_phone,
                      color: Theme.of(context).primaryColor,
                    ))
                  ]),
                ],
              ),
            ],
          )),
      new Container(
        padding: EdgeInsets.all(16.0),
      )
    ]);
  }
}
