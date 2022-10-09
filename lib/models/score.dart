class Score {
  Score({
    this.author,
    required this.type,
    required this.value,
    required this.score,
    required this.comments,
  });

  String? author;
  final String type;
  final String value;
  final int score;
  final String comments;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
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
