import 'dart:convert';

UserGetId userGetIdFromJson(String str) => UserGetId.fromJson(json.decode(str));

String userGetIdToJson(UserGetId data) => json.encode(data.toJson());

class UserGetId {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? document;

  UserGetId({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.document,
  });

  factory UserGetId.fromJson(Map<String, dynamic> json) => UserGetId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        document: json["document"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "photo": photo,
        "document": document,
      };
}
