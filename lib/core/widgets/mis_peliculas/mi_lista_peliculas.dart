import 'package:flutter/material.dart';
import 'package:peliculas/models/mis_peliculas/models.dart';
import 'package:peliculas/providers/providers_mispeliculas.dart';
import 'package:peliculas/routes/routes_peliculas.dart';
import 'package:provider/provider.dart';

class MiListaPeliculas extends StatelessWidget {
  final List<ModelMiPelicula> misPelis;

  const MiListaPeliculas({super.key, required this.misPelis});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: misPelis.map((peli) => _ElemPeli(miPelicula: peli)).toList());
  }
}

class _ElemPeli extends StatelessWidget {
  final ModelMiPelicula miPelicula;
  const _ElemPeli({required this.miPelicula});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("TITULO"),
      onTap: () {
        Navigator.of(context).pushNamed(RoutesPeliculas.misPeliculasDetalle,
            arguments: miPelicula);
      },
      onLongPress: () {
        showMenu(
          context: context, 
          position: RelativeRect.fill, 
          items: [
              PopupMenuItem(
                child: Text('Borrar Película'),
                onTap: (){
                },
              )
                ]
          );
      },
    );
  }
}
