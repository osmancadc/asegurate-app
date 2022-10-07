import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person person) => json.encode(person.toJson());

class Person {
  String? document;
  String? expeditionDate;
  String? email;
  String? phone;
  String? role;
  String? password;
  Person({
    this.document,
    this.expeditionDate,
    this.email,
    this.phone,
    this.role,
    this.password,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
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
