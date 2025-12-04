import 'dart:convert';

import 'package:peliculas/models/models.dart';

class MovieSearch {
  int page;
  List<ModelMovie> results;
  int totalPages;
  int totalResults;

  MovieSearch({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieSearch.fromRawJson(String str) =>
      MovieSearch.fromJson(json.decode(str));

  factory MovieSearch.fromJson(Map<String, dynamic> json) => MovieSearch(
    page: json["page"],
    results: List<ModelMovie>.from(
      json["results"].map((x) => ModelMovie.fromJson(x)),
    ),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}
