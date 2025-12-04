import 'dart:convert';

class ModelMovie {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ModelMovie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory ModelMovie.fromRawJson(String str) =>
      ModelMovie.fromJson(json.decode(str));

  factory ModelMovie.fromJson(Map<String, dynamic> json) => ModelMovie(
    adult: json["adult"] ?? false,
    backdropPath: json["backdrop_path"] ?? "",
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"] ?? 0,
    originalLanguage: json["original_language"] ?? "",
    originalTitle: json["original_title"] ?? "",
    overview: json["overview"] ?? "",
    popularity: json["popularity"]?.toDouble() ?? 0,
    posterPath: json["poster_path"] ?? "",
    releaseDate: json["release_date"] ?? "",
    title: json["title"] ?? "",
    video: json["video"] ?? "",
    voteAverage: json["vote_average"]?.toDouble() ?? 0,
    voteCount: json["vote_count"] ?? 0,
  );
}
