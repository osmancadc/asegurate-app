// To parse this JSON data, do
//
//     final getScore = getScoreFromJson(jsonString);

import 'dart:convert';

GetScore getScoreFromJson(String str) => GetScore.fromJson(json.decode(str));

String getScoreToJson(GetScore data) => json.encode(data.toJson());

class GetScore {
  String? document;
  String? type;
  GetScore({
    this.document,
    this.type,
  });

  factory GetScore.fromJson(Map<String, dynamic> json) => GetScore(
        document: json["identification"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "document": document,
        "type": type,
      };
}
