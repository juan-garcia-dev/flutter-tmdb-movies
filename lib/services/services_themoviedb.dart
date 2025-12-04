import 'package:flutter/material.dart';
import 'package:peliculas/models/model_movie.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/model_popular.dart';
import 'package:peliculas/models/model_search.dart';
import 'package:peliculas/models/model_top_rated.dart';
import 'package:peliculas/models/models.dart';

class ServicesThemoviedb {
  ServicesThemoviedb._();

  static final ServicesThemoviedb instance = ServicesThemoviedb._();

  Future<List<ModelMovie>> getTopRatedMovies() async {
    final uri = Uri.https("api.themoviedb.org", "/3/movie/top_rated", {
      "languaje": "es-Es",
      "page": "1",
    });
    final resultados = await http.get(
      uri,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ5NzNlZDZjMGIwMmM1MzBiZDkzMWEwMmNlZmIyOSIsIm5iZiI6MTc2NDAxOTY4OS41MTQsInN1YiI6IjY5MjRjZGU5ZDBkN2I5NmI0MDA1ZDQ5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8i8CXHhUA3g25Fhi0pckA1Yi5YrlwNkRK4JQR1rb0VY",
        "accept": "application/json",
      },
    );

    if (resultados.statusCode == 200) {
      final contido = resultados.body;
      final modelTopRated = ModelTopRated.fromRawJson(contido);
      return modelTopRated.results;
    } else {
      debugPrint(resultados.statusCode.toString());
      return [];
    }
  }

  Future<List<ModelMovie>> getPopularMovies({int numIndices = 1}) async {
    final uri = Uri.https("api.themoviedb.org", "/3/movie/popular", {
      "language": "es-Es",
      "page": "$numIndices",
    });

    final resultados = await http.get(
      uri,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ5NzNlZDZjMGIwMmM1MzBiZDkzMWEwMmNlZmIyOSIsIm5iZiI6MTc2NDAxOTY4OS41MTQsInN1YiI6IjY5MjRjZGU5ZDBkN2I5NmI0MDA1ZDQ5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8i8CXHhUA3g25Fhi0pckA1Yi5YrlwNkRK4JQR1rb0VY',
        'accept': 'application/json',
      },
    );
    if (resultados.statusCode == 200) {
      final contido = resultados.body;
      final modelPopular = ModelPopular.fromRawJson(contido);
      return modelPopular.results;
    } else {
      return [];
    }
  }

  Future<List<Actor>> getActores({required int id}) async {
    final uri = Uri.https("api.themoviedb.org", "/3/movie/$id/credits", {
      "language": "es-Es",
    });

    final resultados = await http.get(
      uri,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ5NzNlZDZjMGIwMmM1MzBiZDkzMWEwMmNlZmIyOSIsIm5iZiI6MTc2NDAxOTY4OS41MTQsInN1YiI6IjY5MjRjZGU5ZDBkN2I5NmI0MDA1ZDQ5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8i8CXHhUA3g25Fhi0pckA1Yi5YrlwNkRK4JQR1rb0VY',
        'accept': 'application/json',
      },
    );

    if (resultados.statusCode == 200) {
      final contido = resultados.body;
      final modelActor = Actores.fromRawJson(contido);
      return modelActor.cast;
    } else {
      return [];
    }
  }

  Future<List<ModelMovie>> getPelisByText({required String text}) async {
    final uri = Uri.https("api.themoviedb.org", "/3/search/movie", {
      "query": text,
      "language": "es-Es",
      "page": "1",
    });

    final resultados = await http.get(
      uri,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NzQ5NzNlZDZjMGIwMmM1MzBiZDkzMWEwMmNlZmIyOSIsIm5iZiI6MTc2NDAxOTY4OS41MTQsInN1YiI6IjY5MjRjZGU5ZDBkN2I5NmI0MDA1ZDQ5YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8i8CXHhUA3g25Fhi0pckA1Yi5YrlwNkRK4JQR1rb0VY',
        'accept': 'application/json',
      },
    );

    if (resultados.statusCode == 200) {
      final contido = resultados.body;
      final modelSeach = MovieSearch.fromRawJson(contido);
      return modelSeach.results;
    } else {
      return [];
    }
  }
}
