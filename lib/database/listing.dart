final maoShanWang = "Mao Shan Wang";
final d1 = "D1";
final goldenPhoenix = "Golden Phoenix";
final d101 = "D101";
final blackPearl = "Black Pearl";

final maoShanWangDesc =
    "Durian connoisseurs love its bittersweet taste and creamy, sticky texture...";

final d1Desc =
    "Small seeds with milky taste, flesh slips off the seeds with a crunch on the surf...";
final d101Desc = "Easy on the palate, slightly sweet and creamy...";

class Listing {
  String id;
  String type;
  String image;
  String description;
  num price;

  Listing(this.id, this.description, this.type, this.image, this.price) {
    if (image == null) {
      image = 'assets/images/durian-badge.png';
    }
  }
}
