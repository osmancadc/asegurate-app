// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        this.user,
        this.password,
    });

    String? user;
    String? password;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        user: json.containsKey('user') ? json['user'] as String : null,
        password: json.containsKey('password') ? json['password'] as String : null,
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "password": password,
    };
}
