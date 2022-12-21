import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.email,
    this.id,
    this.password,
  });

  String email;
  int id;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        id: json["id"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "password": password,
      };
  @override
  String toString() {
    String result = password;
    return result;
  }
}
