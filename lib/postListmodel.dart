// To parse this JSON data, do
//
//     final postListmodel = postListmodelFromJson(jsonString);

import 'dart:convert';

PostListmodel postListmodelFromJson(String str) => PostListmodel.fromJson(json.decode(str));

String postListmodelToJson(PostListmodel data) => json.encode(data.toJson());

class PostListmodel {
  PostListmodel({
   required this.userId,
   required this.id,
   required this.title,
   required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostListmodel.fromJson(Map<String, dynamic> json) => PostListmodel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
