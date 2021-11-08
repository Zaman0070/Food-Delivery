// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  BlogModel({
    this.data,
  });

  BlogDetails? data;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    data: BlogDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class BlogDetails {
  BlogDetails({
    this.id,
    this.title,
    this.slug,
    this.featuredImage,
    this.content,
    this.publishedAt,
    this.views,
    this.likes,
    this.dislikes,
    this.commentsCount,
    this.updatedAt,
    this.author,
    this.tags,
    this.comments,
  });

  int? id;
  String? title;
  String? slug;
  String? featuredImage;
  String? content;
  String? publishedAt;
  int? views;
  int? likes;
  int? dislikes;
  int? commentsCount;
  String? updatedAt;
  Author? author;
  List<String>? tags;
  List<Comment>? comments;

  factory BlogDetails.fromJson(Map<String, dynamic> json) => BlogDetails(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    featuredImage: json["featured_image"]?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
    content: json["content"],
    publishedAt: json["published_at"],
    views: json["views"],
    likes: json["likes"],
    dislikes: json["dislikes"],
    commentsCount: json["comments_count"],
    updatedAt: json["updated_at"],
    author: Author.fromJson(json["author"]),
    tags: List<String>.from(json["tags"].map((x) => x)),
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "featured_image": featuredImage,
    "content": content,
    "published_at": publishedAt,
    "views": views,
    "likes": likes,
    "dislikes": dislikes,
    "comments_count": commentsCount,
    "updated_at": updatedAt,
    "author": author!.toJson(),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
  };
}

class Author {
  Author({
    this.id,
    this.name,
    this.avatar,
  });

  int? id;
  String? name;
  String? avatar;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
  };
}

class Comment {
  Comment({
    this.id,
    this.content,
    this.likes,
    this.dislikes,
    this.publishedAt,
    this.author,
  });

  int? id;
  String? content;
  int? likes;
  int? dislikes;
  String? publishedAt;
  Author? author;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    content: json["content"],
    likes: json["likes"],
    dislikes: json["dislikes"],
    publishedAt: json["published_at"],
    author: Author.fromJson(json["author"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "likes": likes,
    "dislikes": dislikes,
    "published_at": publishedAt,
    "author": author!.toJson(),
  };
}
