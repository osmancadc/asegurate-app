import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? document;
  String? expeditionDate;
  String? email;
  String? phone;
  String? role;
  String? password;
  User({
    this.document,
    this.expeditionDate,
    this.email,
    this.phone,
    this.role,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        document: json["document"],
        expeditionDate: json["expeditionDate"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "document": document,
        "expedition_date": expeditionDate,
        "email": email,
        "phone": phone,
        "role": role,
        "password": password,
      };
}
