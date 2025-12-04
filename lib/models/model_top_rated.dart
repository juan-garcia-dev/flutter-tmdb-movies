import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:peliculas/models/models.dart';

class ModelTopRated {
  int page;
  List<ModelMovie> results;
  int totalPages;
  int totalResults;

  ModelTopRated({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ModelTopRated.fromRawJson(String str) =>
      ModelTopRated.fromJson(json.decode(str));

  factory ModelTopRated.fromJson(Map<String, dynamic> json) => ModelTopRated(
    page: json["page"] ?? 0,
    results: List<ModelMovie>.from(
      json["results"].map((x) => ModelMovie.fromJson(x)),
    ),
    totalPages: json["total_pages"] ?? 0,
    totalResults: json["total_results"] ?? 0,
  );
}
