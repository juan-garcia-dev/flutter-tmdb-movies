import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes_peliculas.dart';

import '../../models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<ModelMovie> peliculas;
  final Function siguientePagina;
  const MovieSlider({
    super.key,
    required this.peliculas,
    required this.siguientePagina,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  var scrollController = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (!isLoading &&
          scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200) {
        widget.siguientePagina();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: _getLista()),
        ],
      ),
    );
  }

  Widget _getLista() => ListView.builder(
    scrollDirection: Axis.horizontal,
    controller: scrollController,
    itemBuilder: (_, indice) =>
        _MoviePoster(pelicula: widget.peliculas[indice]),
    itemCount: widget.peliculas.length,
  );
}

class _MoviePoster extends StatelessWidget {
  final ModelMovie pelicula;
  const _MoviePoster({required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("detail", arguments: pelicula);
      },
      child: Container(
        width: 100,
        height: 180,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: pelicula.posterPath == ""
                    ? Image.asset("assets/cardswiper/loading.gif")
                    : FadeInImage(
                        placeholder: AssetImage(
                          "assets/cardswiper/loading.gif",
                        ),
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${pelicula.posterPath}",
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
