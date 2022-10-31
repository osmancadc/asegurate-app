import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    required this.comments,
  });

  final List<CommentElement> comments;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comments:
            List<CommentElement>.from(json["comments"].map((x) => CommentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class CommentElement {
  CommentElement({
    required this.author,
    required this.photo,
    required this.score,
    required this.comment,
  });

  final String author;
  final String photo;
  final int score;
  final String comment;

  factory CommentElement.fromJson(Map<String, dynamic> json) => CommentElement(
        author: json["author"],
        photo: json["photo"],
        score: json["score"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "photo": photo,
        "score": score,
        "comment": comment,
      };
}
