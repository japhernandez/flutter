import 'package:flutter/material.dart';
import 'package:netflix/pages/inicio.dart';
import 'package:netflix/pages/pelicula-detalle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainPage(),
        'detalle': (BuildContext context) => MovieDetail()
      },
    );
  }
}
