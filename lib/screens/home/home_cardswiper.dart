import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/core/widgets/widgets.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/providers_peliculas.dart';
import 'package:provider/provider.dart';

class HomeCardswiper extends StatelessWidget {
  const HomeCardswiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerTheMovieDB = Provider.of<ProvidersPeliculas>(
      context,
      listen: false,
    );
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: FutureBuilder(
            future: providerTheMovieDB.getTopRatedMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error"));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final pelis = snapshot.data ?? [];
              return _miSwiper(pelis: pelis);
            },
          ),
        ),

        FutureBuilder(
          future: providerTheMovieDB.getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Se paciente mientras cargan las peliculas"),
                ],
              );
            }

            final data = snapshot.data ?? [];
            return Consumer<ProvidersPeliculas>(
              builder:
                  (
                    BuildContext context,
                    ProvidersPeliculas value,
                    Widget? child,
                  ) => MovieSlider(
                    peliculas: data,
                    siguientePagina: value.getPopularMovies,
                  ),
            );
          },
        ),
      ],
    );
  }
}

class _miSwiper extends StatelessWidget {
  const _miSwiper({super.key, required this.pelis});
  final List<ModelMovie> pelis;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Swiper(
      itemCount: pelis.length,
      itemHeight: size.height * 0.4,
      itemWidth: size.width * 0.6,
      layout: SwiperLayout.STACK,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("detail", arguments: pelis[index]);
          },
          child: ClipRRect(
            borderRadius: const BorderRadiusGeometry.all(Radius.circular(30)),
            child: pelis[index].posterPath == ""
                ? Image.asset("")
                : FadeInImage(
                    placeholder: const AssetImage(
                      "assets/cardswiper/loading.gif",
                    ),
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${pelis[index].posterPath}",
                    ),
                  ),
          ),
        );
      },
    );
  }
}
