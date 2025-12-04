import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:peliculas/models/models.dart';

class DetailPosterAndTitle extends StatelessWidget {
  final ModelMovie pelicula;
  const DetailPosterAndTitle({super.key, required this.pelicula});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/${pelicula.posterPath}",
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/cardswiper/no-image.jpg"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pelicula.title,
                    style: textTheme.titleLarge,
                    maxLines: 2,
                  ),
                  Text(
                    pelicula.originalTitle,
                    style: textTheme.titleMedium,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RatingBar.builder(
                          initialRating: pelicula.voteAverage / 2,
                          ignoreGestures: true,
                          minRating: 1,
                          itemSize: 10,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (_) {},
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(child: Text(pelicula.voteAverage.toString())),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
