import 'package:flutter/material.dart';
import 'package:peliculas/models/mis_peliculas/models.dart';
import 'package:peliculas/core/widgets/mis_peliculas/mi_lista_peliculas.dart';
import 'package:peliculas/providers/providers_mispeliculas.dart';
import 'package:peliculas/routes/routes_peliculas.dart';
import 'package:provider/provider.dart';

class ListaPeliculasScreen extends StatelessWidget {
const ListaPeliculasScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        }, 
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Mis Películas'),
      ),
      body: Container()
        
    );
  }
}

