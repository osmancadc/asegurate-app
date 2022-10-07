// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User user) => json.encode(user.toJson());

class User {
  User({
    this.document,
    this.password,
  });

  String? document;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        document:
            json.containsKey('document') ? json['document'] as String : null,
        password:
            json.containsKey('password') ? json['password'] as String : null,
      );

  Map<String, dynamic> toJson() => {
        "document": document,
        "password": password,
      };
}
