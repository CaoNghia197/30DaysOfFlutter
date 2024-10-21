// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

import 'dart:convert';

New newFromJson(String str) => New.fromJson(json.decode(str));

String newToJson(New data) => json.encode(data.toJson());

class New {
  int id;
  String title;
  String summary;
  String link;
  String image;
  String published;

  New({
    required this.id,
    required this.title,
    required this.summary,
    required this.link,
    required this.image,
    required this.published,
  });

  factory New.fromJson(Map<String, dynamic> json) => New(
        id: json["id"],
        title: json["title"],
        summary: json["summary"] ?? "",
        link: json["link"] ?? "",
        image: json["image"] ?? "",
        published: json["published"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "summary": summary,
        "link": link,
        "image": image,
        "published": published,
      };

  @override
  String toString() {
    return 'New{id: $id, title: $title, summary: $summary, link: $link, image: $image, published: $published}';
  }
}
