// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.document,
    this.password,
  });

  String? document;
  String? password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
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
