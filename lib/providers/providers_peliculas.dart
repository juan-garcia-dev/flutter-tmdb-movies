import 'package:flutter/material.dart';
import 'package:peliculas/models/model_popular.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/services/services_mis_peliculas.dart';
import 'package:peliculas/services/services_themoviedb.dart';

class ProvidersPeliculas with ChangeNotifier {
  List<ModelMovie> _topRated = [];
  int _numPageTopRates = 1;
  List<ModelMovie> moviesSearch = [];

  Future<List<ModelMovie>> getTopRatedMovies() async {
    final movies = await ServicesThemoviedb.instance.getTopRatedMovies();
    return movies;
  }

  Future<List<ModelMovie>> getPopularMovies() async {
    final result = await ServicesThemoviedb.instance.getPopularMovies(
      numIndices: _numPageTopRates,
    );
    if (result.isNotEmpty) {
      _topRated.addAll(result);
      _numPageTopRates++;
    }
    notifyListeners();
    return _topRated;
  }

  Future<List<Actor>> getActores({required int id}) async {
    final result = await ServicesThemoviedb.instance.getActores(id: id);
    return result;
  }

  Future<List<ModelMovie>> getSearchMovies({required String texto}) async {
    final result = await ServicesThemoviedb.instance.getPelisByText(
      text: texto,
    );
    return result;
  }
}
