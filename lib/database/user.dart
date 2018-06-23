import './review.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  List<Review> reviews;

  User(this.id, this.name, this.email, this.password, this.reviews);
}
