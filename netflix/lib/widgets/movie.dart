import 'package:flutter/material.dart';
import 'package:netflix/models/pelicula.dart';

class Movie extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  Movie({@required this.peliculas, @required this.siguientePagina});
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    // Este listener carga la data cuando este a 200px del final de la pantalla
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.15,
      child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: peliculas.length,
          itemBuilder: (context, i) => _card(context, peliculas[i])),
    );
  }

  Widget _card(BuildContext context, Pelicula pelicula) {
    final card = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(110.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(pelicula.getPosterImage()),
                  fit: BoxFit.cover,
                  height: 110.0,
                  width: 110.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ));

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }
}
