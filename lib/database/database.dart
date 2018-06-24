import './review.dart';
import './user.dart';
import './listing.dart';
import './drop.dart';
import './seller.dart';
import './order.dart';
import 'package:latlong/latlong.dart';

class Database {
  static final sellerReviews = [
    new Review("0", 4.5, "Wonderful tasting, most amazing durian ever!"),
    new Review("1", 3.5, "Average lah, could have been better."),
    new Review("2", 2.5, "Really disliked the durian. Was sour and old >:("),
    new Review(
        "3", 5, "Woah?! Didn't know such good durian exists in Singapore"),
    new Review("4", 4, "Good job! I love durians from your store."),
    new Review("5", 1, "I am running out of things to say to be honest."),
    new Review("6", 2, "Horrible horrible horrible. I hate durian."),
    new Review("7", 5, "Wah always fast and good quality!"),
    new Review(
        "8", 3, "Sorely disappointed by quality from the king of fruits."),
    new Review("9", 2, "First try at this stall, can do better...."),
    new Review("10", 1.5, "Asked for five and none were decent!!!"),
    new Review("11", 0, "Came home to durians that were almost rotten >:("),
    new Review("12", 4, "Durians are just ripe and tasty!"),
  ];

  static final users = [
    new User("0", "John Doe", "john@gmail.com", "123456", [
      sellerReviews[0],
      sellerReviews[1],
      sellerReviews[11],
    ]),
    new User("1", "Wang Jia Dong", "wjd2000@gmail.com", "123456", [
      sellerReviews[2],
      sellerReviews[3],
      sellerReviews[12],
    ]),
    new User("2", "Jennifer Bob", "jenbob@hotmail.com", "123456", [
      sellerReviews[4],
      sellerReviews[5],
      sellerReviews[9],
      sellerReviews[10],
    ]),
    new User("3", "Arkham Bossini", "arkbossb@hotmail.com", "123456", [
      sellerReviews[6],
      sellerReviews[7],
      sellerReviews[8],
    ]),
  ];

  static final drops = [
    new Drop("0", maoShanWang, 18.5, deadline: 3),
    new Drop("1", d101, 15.5, deadline: 4),
    new Drop("2", goldenPhoenix, 37.2, deadline: 5),
  ];

  static final listings = [
    new Listing("0", maoShanWangDesc, maoShanWang,
        "assets/images/durian-MSW.png", 17.5),
    new Listing("1", d1Desc, d1, "assets/images/durian-D1.png", 21.5),
    new Listing("2", d101Desc, d101, "assets/images/durian-D101.png", 54.5),
    new Listing("3", maoShanWangDesc, maoShanWang,
        "assets/images/durian-MSW.png", 32.4),
    new Listing("4", d1Desc, d1, "assets/images/durian-D1.png", 23.1),
    new Listing("5", maoShanWangDesc, maoShanWang,
        "assets/images/durian-MSW.png", 53.2),
    new Listing("6", d101Desc, d101, "assets/images/durian-D101.png", 12.5),
    new Listing("7", d1Desc, d1, "assets/images/durian-D1.png", 5.7),
    new Listing("8", d101Desc, d101, "assets/images/durian-D101.png", 12.22),
    new Listing("9", maoShanWangDesc, maoShanWangDesc,
        "assets/images/durian-MSW.png", 30.34),
  ];

  static final sellers = <Seller>[
    new Seller(
      "1",
      name: "Tin Bing Durians",
      location: new LatLng(1.366942, 103.926576),
      reviews: [sellerReviews[0], sellerReviews[3], sellerReviews[7]],
      listings: [listings[0], listings[1], listings[2]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "2",
      name: "Durian Queen",
      location: new LatLng(1.321773, 103.852632),
      reviews: [sellerReviews[1], sellerReviews[6]],
      listings: [listings[3]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "3",
      name: "Fruit King",
      location: new LatLng(1.353064, 103.710754),
      reviews: [sellerReviews[2], sellerReviews[5], sellerReviews[8]],
      listings: [listings[5]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "4",
      name: "Ah Lian Durian",
      location: new LatLng(1.315259, 103.861810),
      reviews: [sellerReviews[4]],
      listings: [listings[6], listings[7]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "5",
      name: "Ah Beng Durian",
      location: new LatLng(1.316625, 103.857760),
      reviews: [sellerReviews[10], sellerReviews[11]],
      listings: [listings[8]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "6",
      name: "Lim Durians",
      location: new LatLng(1.323732, 103.854964),
      reviews: [sellerReviews[9]],
      listings: [listings[9]],
      drops: [drops[0], drops[1], drops[2]],
    ),
    new Seller(
      "7",
      name: "Durian Durian",
      location: new LatLng(1.313912, 103.877009),
      reviews: [sellerReviews[11]],
      listings: [listings[4]],
      drops: [drops[0], drops[1], drops[2]],
    ),
  ];
  static final orders = <Order>[
    new Order("1", users[0], sellers[0], 5, listings[0], ""),
    new Order("2", users[2], sellers[1], 2, listings[3], "AS DELIVERY"),
  ];
}
