import 'dart:convert';

BlogsModel blogModelFromJson(String str) => BlogsModel.fromJson(json.decode(str));

String blogModelToJson(BlogsModel data) => json.encode(data.toJson());

class BlogsModel {
  BlogsModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Blog>? data;
  Links? links;
  Meta? meta;

  factory BlogsModel.fromJson(Map<String, dynamic> json) => BlogsModel(
        data: List<Blog>.from(json["data"].map((x) => Blog.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class Blog {
  Blog({
    this.id,
    this.title,
    this.slug,
    this.excerpt,
    this.featuredImage,
    this.publishedAt,
    this.views,
    this.likes,
    this.dislikes,
    this.commentsCount,
    this.updatedAt,
    this.author,
  });

  int? id;
  String? title;
  String? slug;
  String? excerpt;
  String? featuredImage;
  String? publishedAt;
  int? views;
  int? likes;
  int? dislikes;
  int? commentsCount;
  String? updatedAt;
  Author? author;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        excerpt: json["excerpt"],
        featuredImage: json["featured_image"],
        publishedAt: json["published_at"],
        views: json["views"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        commentsCount: json["comments_count"],
        updatedAt: json["updated_at"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "excerpt": excerpt,
        "featured_image": featuredImage,
        "published_at": publishedAt,
        "views": views,
        "likes": likes,
        "dislikes": dislikes,
        "comments_count": commentsCount,
        "updated_at": updatedAt,
        "author": author!.toJson(),
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

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
