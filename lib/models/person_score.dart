class PersonScore {
  PersonScore({
    required this.gender,
    required this.name,
    required this.document,
    required this.stars,
    required this.reputation,
    required this.score,
    required this.certified,
    required this.photo,
  });

  final String gender;
  final String name;
  final String document;
  final int stars;
  final int reputation;
  final int score;
  final bool certified;
  final String photo;

  factory PersonScore.fromJson(Map<String, dynamic> json) => PersonScore(
        gender: json["gender"],
        name: json["name"],
        document: json["document"],
        stars: json["stars"],
        reputation: json["reputation"],
        score: json["score"],
        certified: json["certified"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name,
        "document": document,
        "stars": stars,
        "reputation": reputation,
        "score": score,
        "certified": certified,
        "photo": photo,
      };
}
