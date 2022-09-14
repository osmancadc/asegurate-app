// To parse this JSON data, do
//
//     final uploadScore = uploadScoreFromJson(jsonString);

import 'dart:convert';

UploadScore uploadScoreFromJson(String str) =>
    UploadScore.fromJson(json.decode(str));

String uploadScoreToJson(UploadScore data) => json.encode(data.toJson());

class UploadScore {
  String? document;
  String? type;
  String? name;
  String? lastName;
  int? score;
  String? comments;
  UploadScore({
    this.document,
    this.type,
    this.name,
    this.lastName,
    this.score,
    this.comments,
  });

  factory UploadScore.fromJson(Map<String, dynamic> json) => UploadScore(
        document: json["document"],
        type: json["type"],
        name: json["name"],
        lastName: json["lastName"],
        score: json["score"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "document": document,
        "type": type,
        "name": name,
        "lastName": lastName,
        "score": score,
        "comments": comments,
      };
}
