
import 'package:flutter/material.dart';
import 'package:peliculas/routes/routes_peliculas.dart';

class MaterialPeliculas extends StatelessWidget {
const MaterialPeliculas({ super.key });

  @override
  Widget build(BuildContext context){
    print("DIBUJA MATERIAL");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesPeliculas.getRoutes(),
      initialRoute: RoutesPeliculas.inicialScreen,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 0
        )
      ),
    );
  }
}