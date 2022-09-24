import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  String? document;
  String? name;
  String? expeditionDate;
  String? email;
  String? phone;
  String? role;
  String? password;
  String? image;
  User({

    this.document,
    this.name,
    this.expeditionDate,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
   
        document: json["document"],
        name: json["name"],
        expeditionDate: json["expeditionDate"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
    
        "document": document,
        "name": name,
        "expeditionDate": expeditionDate,
        "email": email,
        "phone": phone,
        "role": role,
        "password": password,
        "image": image,
      };
}
