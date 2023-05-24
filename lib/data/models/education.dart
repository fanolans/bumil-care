import 'dart:convert';

List<Education> educationFromJson(String str) =>
    List<Education>.from(json.decode(str).map((x) => Education.fromJson(x)));

String educationToJson(List<Education> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Education {
  String description;
  int id;
  String imageUrl;
  String title;

  Education({
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        description: json["description"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "imageUrl": imageUrl,
        "title": title,
      };
}
