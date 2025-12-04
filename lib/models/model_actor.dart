import 'dart:convert';

class Actor {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String job;

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.job,
  });

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
    adult: json["adult"] ?? false,
    gender: json["gender"] ?? 0,
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    originalName: json["original_name"] ?? "",
    popularity: json["popularity"].toDouble() ?? 0,
    profilePath: json["profile_path"] ?? "",
    castId: json["cast_id"] ?? 0,
    character: json["character"] ?? "",
    creditId: json["credit_id"] ?? "",
    order: json["order"] ?? 0,
    job: json["job"] ?? "",
  );
}
