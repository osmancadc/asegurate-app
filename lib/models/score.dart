class Score {
  Score({
    this.author,
    required this.type,
    required this.objective,
    required this.score,
    required this.comments,
  });

  String? author;
  final String type;
  final String objective;
  final int score;
  final String comments;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        author: json["author"],
        type: json["type"],
        objective: json["objective"],
        score: json["score"],
        comments: json["comments"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "type": type,
        "objective": objective,
        "score": score,
        "comments": comments,
      };
}
