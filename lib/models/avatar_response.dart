class AvatarResponse {
  AvatarResponse({
    required this.message,
    required this.photo,
  });

  final String message;
  final String photo;

  factory AvatarResponse.fromJson(Map<String, dynamic> json) => AvatarResponse(
        message: json["message"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "photo": photo,
      };
}
