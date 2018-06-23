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
    if (background == null) {
      background = 'assets/images/durian-badge.png';
    }
  }
  num rating() {
    num res = 0;
    reviews.forEach((i) => res += i.rating);
    return res;
  }
}
