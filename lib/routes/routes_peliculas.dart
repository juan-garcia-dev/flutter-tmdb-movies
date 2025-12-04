
import 'package:flutter/material.dart';
import 'package:peliculas/screens/detail/detail_screen.dart';
import 'package:peliculas/screens/home/home_screen.dart';
import 'package:peliculas/screens/inicial_screen.dart';
import 'package:peliculas/screens/mispeliculas/detalle_mispeliculas.dart';
import 'package:peliculas/screens/mispeliculas/lista_peliculas_screen.dart';

class RoutesPeliculas {
  static const String home="home";
  static const String detail = "detail";
  static const String misPeliculasDetalle = "mispelis_detalle";
  static const String misPeliculasLista = "mispelis_lista";
  static const String inicialScreen = "inicial_screen";

  static Map<String,WidgetBuilder>getRoutes() => {
    home : ( _ ) => HomeScreen(),
    detail : ( _ ) => DetailScreen(),
    misPeliculasDetalle: ( _ ) => DetalleMispeliculas(),
    misPeliculasLista: ( _ ) => ListaPeliculasScreen(),
    inicialScreen: ( _ ) => InicialScreen()
  };


}