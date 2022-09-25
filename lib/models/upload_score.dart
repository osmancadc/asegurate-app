// To parse this JSON data, do
//
//     final uploadScore = uploadScoreFromJson(jsonString);

import 'dart:convert';

UploadScore uploadScoreFromJson(String str) =>
    UploadScore.fromJson(json.decode(str));

String uploadScoreToJson(UploadScore data) => json.encode(data.toJson());

class UploadScore {
  int? author;
  String? type;
  String? value;
  int? score;
  String? comments;
  UploadScore({
    this.author,
    this.type,
    this.value,
    this.score,
    this.comments,
  });

  factory UploadScore.fromJson(Map<String, dynamic> json) => UploadScore(
        author: json["author"],
        type: json["type"],
        value: json["value"],
        score: json["score"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "type": type,
        "value": value,
        "score": score,
        "comments": comments,
      };
}
