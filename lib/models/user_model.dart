// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String user;
  String document;
  String name;
  String role;
  String password;
  User({
    required this.user,
    required this.document,
    required this.name,
    required this.role,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        document: json["document"],
        name: json["name"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "document": document,
        "name": name,
        "role": role,
        "password": password,
      };
}
