// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? user;
  String? password;
  Login({
    this.user,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        user: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": user,
        "password": password,
      };
}
