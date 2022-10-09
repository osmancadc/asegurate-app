class AuthenticationResponse {
  AuthenticationResponse({
    required this.expiresIn,
    required this.message,
    required this.token,
  });

  final int expiresIn;
  final String message;
  final String token;

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) => AuthenticationResponse(
        expiresIn: json["expiresIn"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "expiresIn": expiresIn,
        "message": message,
        "token": token,
      };
}
