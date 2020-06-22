import 'package:flutter/material.dart';
import 'package:netflix/widgets/item-imagen.dart';
import 'package:netflix/widgets/item-redondeado.dart';
import 'package:netflix/widgets/principal.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: ListView(children: <Widget>[
              MainPoster(),
              this.list('Avances', RoundedItem(), 6),
              SizedBox(
                height: 10.0,
              ),
              this.list('Programas sobre viajes', ImageItem(), 6)
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

  Widget list(String title, Widget item, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (context, index) {
              return item;
            },
          ),
        )
      ],
    );
  }
}
