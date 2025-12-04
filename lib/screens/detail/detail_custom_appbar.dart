import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class DetailCustomAppbar extends StatelessWidget {
  final ModelMovie pelicula;
  const DetailCustomAppbar({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 30,
          color: Colors.black38,
          child: Text(pelicula.title, style: TextStyle(color: Colors.white)),
        ),
        background: Image.network(
          fit: BoxFit.fill,
          "https://image.tmdb.org/t/p/w500/${pelicula.backdropPath}",
          errorBuilder: (context, error, stackTrace) =>
              Image.asset("assets/cardswiper/no-image.jpg"),
        ),
      ),
    );
  }
}
