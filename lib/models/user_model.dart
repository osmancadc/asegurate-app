// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? user;
  String? document;
  String? name;
  String? lastname;
  String? role;
  String? password;
  User({
    this.user,
    this.document,
    this.name,
    this.lastname,
    this.role,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: json["user"],
        document: json["document"],
        name: json["name"],
        lastname: json["lastname"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "document": document,
        "name": name,
        "lastname": lastname,
        "role": role,
        "password": password,
      };
}
