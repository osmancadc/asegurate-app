import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? username;
  String? document;
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? role;
  String? password;
  String? image;
  User({
    this.username,
    this.document,
    this.name,
    this.lastname,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        document: json["document"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "document": document,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "role": role,
        "password": password,
        "image": image,
      };
}
