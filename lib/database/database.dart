import './review.dart';
import './user.dart';
import './listing.dart';
import './drop.dart';
import './seller.dart';
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
        "8", 3, "Sorely disappointed by quality from the king of fruits haha"),
    new Review("9", 2, "First try at this stall, can do better...."),
    new Review("10", 1.5, "Asked for five and none were decent!!!"),
    new Review("11", 0, "Came home to durians that were almost rotten >:("),
    new Review("12", 4, "Durians are just ripe and tasty!"),
  ];

  static final users = [
    new User("0", "John Doe", "john@gmail.com", "123456", [
      sellerReviews[0],
      sellerReviews[1],
    ]),
    new User("1", "Wang Jia Dong", "wjd2000@gmail.com", "123456", [
      sellerReviews[2],
      sellerReviews[3],
    ]),
    new User("2", "Jennifer Bob", "jenbob@hotmail.com", "123456", [
      sellerReviews[4],
      sellerReviews[5],
    ]),
    new User("2", "Jennifer Bob", "jenbob@hotmail.com", "123456", [
      sellerReviews[4],
      sellerReviews[5],
    ]),
  ];

  static final drops = [
    new Drop("0", maoShanWang, 18.5),
    new Drop("1", d101, 15.5),
    new Drop("2", goldenPhoenix, 37.2),
  ];

  static final listings = [
    new Listing("0", maoShanWang, "al_msw.png", 17.5),
    new Listing("1", d1, "al_d1.png", 21.5),
    new Listing("2", d101, "al_d101.png", 54.5),
    new Listing("3", maoShanWang, "bb_msw.png", 32.4),
    new Listing("4", goldenPhoenix, "bb_gp.png", 23.1),
    new Listing("5", maoShanWang, "omd_msw.png", 53.2),
    new Listing("6", d101, "omd_d101.png", 12.5),
    new Listing("7", d1, "omd_d1.png", 5.7),
    new Listing("8", goldenPhoenix, "jj_gp.png", 12.22),
    new Listing("9", maoShanWang, "jj_msw.png", 30.34),
  ];

  static final sellers = <Seller>[
    new Seller(
      "1",
      name: "Tin Bing Durians",
      location: new LatLng(1.366942, 103.926576),
      reviews: [sellerReviews[0], sellerReviews[3]],
    ),
    new Seller(
      "2",
      name: "Durian Queen",
      location: new LatLng(1.321773, 103.852632),
      reviews: [sellerReviews[1]],
    ),
    new Seller(
      "3",
      name: "Fruit King",
      location: new LatLng(1.353064, 103.710754),
      reviews: [sellerReviews[2], sellerReviews[5]],
    ),
    new Seller(
      "4",
      name: "Ah Lian Durian",
      location: new LatLng(1.315259, 103.861810),
      reviews: [sellerReviews[4]],
    ),
    new Seller("5",
        name: "Ah Beng Durian", location: new LatLng(1.316625, 103.857760)),
    new Seller("6",
        name: "Lim Durians", location: new LatLng(1.323732, 103.854964)),
    new Seller("7",
        name: "Durian Durian", location: new LatLng(1.313912, 103.877009)),
  ];
  //   new Seller("0", "al.png", "al_bg.png", "Ah Lian Durian",
  //       "249 Balestier Road Singapore 329727", "88889899", [
  //     reviews[0],
  //     reviews[3],
  //   ], [
  //     listings[0],
  //     listings[1],
  //     listings[2],
  //   ], [
  //     drops[0],
  //   ], new LatLng(1.366942, 103.926576)),
  //   new Seller("1", "bb.png", "bb_bg.png", "Durian Bao Bei",
  //       "Tampines Ave 19 Singapore 332332", "86746234", [
  //     reviews[1],
  //   ], [
  //     listings[3],
  //     listings[4],
  //   ], [
  //     drops[1],
  //   ], new LatLng(1.321773, 103.852632)),
  //   new Seller("2", "omd.png", "omd_bg.png", "Oh My Durian",
  //       "Jurong West Ave 2 Singapore 324662", "85372893", [
  //     reviews[2],
  //     reviews[5],
  //   ], [
  //     listings[5],
  //     listings[6],
  //     listings[7],
  //   ], [], new LatLng(1.353064, 103.710754)),
  //   new Seller("3", "jj.png", "jj_bg.png", "JoJo Durian",
  //       "29 Durian Close Singapore 294824", "97362847", [
  //     reviews[4],
  //   ], [
  //     listings[8],
  //     listings[9],
  //   ], [
  //     drops[2],
  //   ], new LatLng(1.315259, 103.861810)),
  // new Seller("4", "as.png", "sex.png", "Durian King Fruits", "11 Balestier Rd, Singapore 329675", "81868358", [], [], [], new LatLng(1.316625, 103.857760))],
  // new Seller("5", "as.png", "sex.png", "Sindy Durian", "89 Whampoa Dr", "9710 2427", [], [], [], new LatLng(1.323732, 103.854964))],
  // new Seller("6", "as.png", "sex.png", "Durian Culture", "77 Sims Avenue, Singapore 387419", "6744 5232", [], [], [], new LatLng(1.313912, 103.877009))],
}
