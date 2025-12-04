import 'dart:convert';

import 'package:peliculas/models/models.dart';

class Actores {
  int id;
  List<Actor> cast;
  List<Actor> crew;

  Actores({required this.id, required this.cast, required this.crew});

  factory Actores.fromRawJson(String str) => Actores.fromJson(json.decode(str));

  factory Actores.fromJson(Map<String, dynamic> json) => Actores(
    id: json["id"],
    cast: List<Actor>.from(json["cast"].map((x) => Actor.fromJson(x))),
    crew: List<Actor>.from(json["crew"].map((x) => Actor.fromJson(x))),
  );
}
