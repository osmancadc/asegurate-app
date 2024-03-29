class User {
  User({
    required this.document,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.role,
  });

  final String document;
  final String name;
  final String email;
  final String phone;
  String photo;
  final String gender;
  final String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        document: json["document"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        gender: json["gender"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "document": document,
        "name": name,
        "email": email,
        "phone": phone,
        "photo": photo,
        "gender": gender,
        "role": role,
      };
}
