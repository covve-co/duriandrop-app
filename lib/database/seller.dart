import './review.dart';
import './listing.dart';
import './drop.dart';
import 'package:latlong/latlong.dart';

class Seller {
  String id;
  String image;
  String background;
  String name;
  String address;
  String contact;
  LatLng location;
  List<Review> reviews;
  List<Listing> listings;
  List<Drop> drops;

  Seller(
    this.id, {
    this.image,
    this.background,
    this.name,
    this.address,
    this.contact,
    this.reviews,
    this.listings,
    this.drops,
    this.location,
  }) {
    if (image == null) {
      image = 'assets/images/durian-badge.png';
    }

    if (address == null) {
      address = 'Blk 700, Woodlands Dr 70';
    }

    if (background == null) {
      background = 'assets/images/durian-badge.png';
    }
  }
  num rating() {
    double res = 0.0;
    reviews.forEach((i) => res += i.rating);
    res /= reviews.length.toDouble();
    res *= 2;
    res = res.roundToDouble();
    res /= 2;
    

    return res;
  }
}
