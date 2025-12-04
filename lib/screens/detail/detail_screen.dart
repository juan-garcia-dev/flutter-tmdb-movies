import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/core/widgets/actors_slider.dart';
import 'package:peliculas/providers/providers_peliculas.dart';
import 'package:peliculas/screens/detail/detail_custom_appbar.dart';
import 'package:peliculas/screens/detail/detail_poster_and_title.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pelicula = ModalRoute.of(context)!.settings.arguments as ModelMovie;
    final providerPelis = Provider.of<ProvidersPeliculas>(
      context,
      listen: false,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailCustomAppbar(pelicula: pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              DetailPosterAndTitle(pelicula: pelicula),

              _getSinopsis(texto: pelicula.overview),

              _getListaActores(context, pelicula),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _getListaActores(context, pelicula) {
    final providerPelis = Provider.of<ProvidersPeliculas>(
      context,
      listen: false,
    );
    return FutureBuilder(
      future: providerPelis.getActores(id: pelicula.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        final data = snapshot.data ?? [];
        return ActorsSlider(actores: data);
      },
    );
  }

  Widget _getSinopsis({required String texto}) => Container(
    width: double.infinity,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Text(texto),
  );
}
