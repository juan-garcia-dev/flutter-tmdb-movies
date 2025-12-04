import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes_peliculas.dart';

class InicialScreen extends StatelessWidget {
const InicialScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              textColor: Colors.indigo,
              iconColor: Colors.indigo,
              trailing: Icon(Icons.movie),
              title: Text('TheMovieDB'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutesPeliculas.home);
              },
            ),
            ListTile(
              textColor: Colors.indigo,
              iconColor: Colors.indigo,
              trailing: Icon(Icons.filter_drama_outlined),
              title: Text('Mis Películas'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutesPeliculas.misPeliculasLista);
              },
            )

        ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('PELICULAS'),
        actions: [
            PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context)  => [
                PopupMenuItem(child: Text('TheMovieDB'),value: 0,),
                PopupMenuItem(child: Text('MisPeliculas'),value: 1,),
              ],
              onSelected: (opcion) {
                if(opcion==0) {
                  Navigator.of(context).pushNamed(RoutesPeliculas.home);
                }
                else{
                  Navigator.of(context).pushNamed(RoutesPeliculas.misPeliculasLista);
                }
              },
            )
        ],
      ),
      body: Center(child: Image.asset('assets/movie.png'),),
    );
  }
}