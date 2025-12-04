import 'package:flutter/material.dart';

import '../../models/models.dart';

class ActorsSlider extends StatelessWidget {
  final List<Actor> actores;
  const ActorsSlider({super.key, required this.actores});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, indice) => _Actor(actor: actores[indice]),
        itemCount: actores.length,
      ),
    );
  }
}

class _Actor extends StatelessWidget {
  final Actor actor;
  const _Actor({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/cardswiper/no-image.jpg"),
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/${actor.profilePath}",
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/cardswiper/no-image.jpg"),
              ),
            ),
          ),
          Expanded(
            child: Text(
              actor.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
