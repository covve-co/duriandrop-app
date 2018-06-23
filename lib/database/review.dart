import './database.dart';

class Review {
  String id;
  num rating;
  String description;

  Review(
    this.id,
    this.rating,
    this.description,
  );

  String username() {
    return Database.users
        .where((user) => user.reviews.contains(this))
        .toList()[0]
        .name;
  }
}
