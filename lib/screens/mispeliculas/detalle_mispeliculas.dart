import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:peliculas/models/mis_peliculas/models.dart';
import 'package:path/path.dart' as p;
import 'package:peliculas/providers/providers_mispeliculas.dart';
import 'package:provider/provider.dart';

class DetalleMispeliculas extends StatelessWidget {
  const DetalleMispeliculas({super.key});

  @override
  Widget build(BuildContext context) {
    final ModelMiPelicula miPelicula =
        ModalRoute.of(context)!.settings.arguments as ModelMiPelicula;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: MiCaratula(miPelicula: miPelicula)),
            Expanded(
              flex: 6,
              child: MiFormulario(
                miPelicula: miPelicula,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MiCaratula extends StatefulWidget {
  final ModelMiPelicula miPelicula;
  const MiCaratula({super.key, required this.miPelicula});

  @override
  State<MiCaratula> createState() => _MiCaratulaState();
}

class _MiCaratulaState extends State<MiCaratula> {
  Widget _getImaxe() {
    return Container(
      color: Colors.amber,
      width: 100,
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              child: _getImaxe(),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                iconSize: 40,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () async {
                },
                icon: Icon(Icons.photo_camera),
                alignment: Alignment.topRight,
                color: Colors.white,
                iconSize: 40,
              ),
            )
          ],
        ),
      );
}

class MiFormulario extends StatefulWidget {
  final ModelMiPelicula miPelicula;
  const MiFormulario({super.key, required this.miPelicula});

  @override
  State<MiFormulario> createState() => _MiFormularioState();
}

class _MiFormularioState extends State<MiFormulario> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(

    );
  }

  Widget _getGeneros() {

    return Column();
  }
}
