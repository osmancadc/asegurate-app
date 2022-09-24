// To parse this JSON data, do
//
//     final getScore = getScoreFromJson(jsonString);

import 'dart:convert';

GetScore getScoreFromJson(String str) => GetScore.fromJson(json.decode(str));

String getScoreToJson(GetScore data) => json.encode(data.toJson());

class GetScore {
  String? value;
  String? type;
  GetScore({
    this.value,
    this.type,
  });

  factory GetScore.fromJson(Map<String, dynamic> json) => GetScore(
        value: json["identification"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "type": type,
      };
}
