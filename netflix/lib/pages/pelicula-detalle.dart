import 'package:flutter/material.dart';
import 'package:netflix/models/actores.dart';
import 'package:netflix/models/pelicula.dart';
import 'package:netflix/providers/peliculas.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _createAppBar(pelicula),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(height: 10.0),
          _posterTitle(context, pelicula),
          _description(pelicula),
          _description(pelicula),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Actores participantes'),
          ),
          SizedBox(
            height: 10.0,
          ),
          _addCasting(pelicula)
        ]))
      ],
    ));
  }

  Widget _createAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(20.0),
        title: Text(pelicula.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage(pelicula.getBackgroundImage()),
          // fadeInDuration: Duration(microseconds: 120),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.id.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImage()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.title,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                pelicula.originalTitle,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border),
                  Text(
                    pelicula.voteAverage.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _description(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _addCasting(Pelicula pelicula) {
    final peliculasProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliculasProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _addActorsPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _addActorsPageView(List<Actor> actores) {
    return Container(
      height: 200.0,
      child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1,
          ),
          pageSnapping: false,
          itemCount: actores.length,
          itemBuilder: (context, i) => _cardActor(actores[i])),
    );
  }

  Widget _cardActor(Actor actor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200.0,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(actor.getPosterImageActor()),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              actor.name,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
