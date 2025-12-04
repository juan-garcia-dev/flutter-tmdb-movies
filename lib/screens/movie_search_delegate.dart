import 'package:flutter/material.dart';
import 'package:peliculas/core/widgets/widgets.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/providers_peliculas.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar pelicula";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ProvidersPeliculas miProvider = Provider.of<ProvidersPeliculas>(
      context,
      listen: false,
    );
    return FutureBuilder(
      future: ProvidersPeliculas().getSearchMovies(texto: query),
      builder: (context, snapshot) {
        final data = snapshot.data ?? [];
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final ModelMovie movie = data[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(20),
                ),
                tileColor: Colors.grey.shade300,
                onTap: () =>
                    Navigator.of(context).pushNamed("detail", arguments: movie),
                title: Text(
                  movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  movie.originalTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                    fit: BoxFit.cover,
                    width: 100,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/cardswiper/no-image.jpg"),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
