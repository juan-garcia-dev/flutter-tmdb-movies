import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:peliculas/models/models.dart';

class ModelPopular {
  int page;
  List<ModelMovie> results;
  int totalPages;
  int totalResults;

  ModelPopular({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ModelPopular.fromRawJson(String str) =>
      ModelPopular.fromJson(json.decode(str));

  factory ModelPopular.fromJson(Map<String, dynamic> json) => ModelPopular(
    page: json["page"],
    results: List<ModelMovie>.from(
      json["results"].map((x) => ModelMovie.fromJson(x)),
    ),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}
