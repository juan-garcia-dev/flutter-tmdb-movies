import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/routes/routes_peliculas.dart';

class BusquedaPeliculas extends StatelessWidget {
final List<ModelMovie>listaPeliculas;
const BusquedaPeliculas({ super.key, required this.listaPeliculas });

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: listaPeliculas.length,
      itemBuilder: (_, index) => 
      _PeliculaListTile(pelicula: listaPeliculas[index])
      );
  }
}

class _PeliculaListTile extends StatelessWidget {
  final ModelMovie pelicula;
const _PeliculaListTile({ required this.pelicula });

  @override
  Widget build(BuildContext context){
   
    return ListTile(
      title: Text("PELICULA 1"),
    );
  }
}