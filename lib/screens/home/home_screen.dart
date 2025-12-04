import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/core/widgets/widgets.dart';
import 'package:peliculas/providers/providers_peliculas.dart';
import 'package:peliculas/screens/home/home_cardswiper.dart';
import 'package:peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProvidersPeliculas>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(child: Column(children: [HomeCardswiper()])),
    );
  }
}
