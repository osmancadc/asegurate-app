class UpdateResponse {
  UpdateResponse({
    required this.message,
  });

  final String message;

  factory UpdateResponse.fromJson(Map<String, dynamic> json) => UpdateResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
