
import 'package:flutter/material.dart';
import 'package:peliculas/core/material_peliculas.dart';
import 'package:peliculas/providers/providers_mispeliculas.dart';
import 'package:peliculas/providers/providers_peliculas.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
const Providers({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ProvidersPeliculas()),
        ChangeNotifierProvider(create: ( _ ) => ProvidersMispeliculas())
      ],
      child: MaterialPeliculas(),
      
    );
  }
}