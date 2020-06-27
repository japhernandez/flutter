import 'package:flutter/material.dart';
import 'package:netflix/providers/cartelera.dart';
import 'package:netflix/providers/peliculas.dart';
import 'package:netflix/providers/valoradas.dart';
import 'package:netflix/search/delegate.dart';
import 'package:netflix/widgets/item-imagen.dart';
import 'package:netflix/widgets/movie.dart';
import 'package:netflix/widgets/principal.dart';

class MainPage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  final carteleraProvider = new CarteleraProvider();
  final valoradasProvider = new ValoradasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    carteleraProvider.getCartelera();
    valoradasProvider.getValoradas();

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Streaming free'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
              MainPoster(),
              _popular(context),
              SizedBox(
                height: 5.0,
              ),
              _cartelera(context),
              SizedBox(
                height: 5.0,
              ),
              // _valoradas(context),
              // SizedBox(
              //   height: 20.0,
              // )
            ])),
        bottomNavigationBar: this.navBootom());
  }

  BottomNavigationBar navBootom() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white54,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Inicio',
              style: TextStyle(fontSize: 10.0),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text(
              'Buscar',
              style: TextStyle(fontSize: 10.0),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text(
              'Proximanente',
              style: TextStyle(fontSize: 10.0),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            title: Text(
              'Descargas',
              style: TextStyle(fontSize: 10.0),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              'Más',
              style: TextStyle(fontSize: 10.0),
            )),
      ],
    );
  }

  Widget _cartelera(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'En cartelera',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder(
              stream: carteleraProvider.carteleraStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ImageItem(
                    peliculas: snapshot.data,
                    siguientePagina: carteleraProvider.getCartelera,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ));
  }

  Widget _popular(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Populares',
                    style: Theme.of(context).textTheme.subtitle1)),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Populares',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Movie(
                    peliculas: snapshot.data,
                    siguientePagina: peliculasProvider.getPopulares,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ));
  }

  Widget _valoradas(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Mejor valoradas',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder(
              stream: valoradasProvider.valoradasStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ImageItem(
                    peliculas: snapshot.data,
                    siguientePagina: valoradasProvider.getValoradas,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ));
  }
}
