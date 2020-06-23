import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components Temp')),
      body: ListView(children: _crearItems()),
    );
  }

  List<Widget> _crearItems() {
    // List<Widget> list = new List<Widget>();

    // for (String opt in options) {
    //   final tempWidget = ListTile(title: Text(opt));
    //   list..add(tempWidget)..add(Divider());
    // }
    // return list;

    return options
        .map((item) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(item + '!'),
                  subtitle: Text(item + ' subtitle'),
                  leading: Icon(Icons.access_time),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
