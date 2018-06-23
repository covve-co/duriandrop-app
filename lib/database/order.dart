import 'user.dart';
import 'seller.dart';
import 'listing.dart';

class Order {
  //Unique Identifier
  String id;
  //User who orders
  User orderer;
  //Seller providing durian
  Seller seller;
  //Mass of Order
  int amount;
  //Durian information
  Listing listing;
  //Status
  String deliveryStatus;

  Order(this.id, this.orderer, this.seller, this.amount, this.listing,
      this.deliveryStatus);
}
