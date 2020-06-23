import 'package:components/src/providers/menu.dart';
import 'package:components/src/utils/icon-util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
        future: menuProvider.extractData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => ListView(
              children: _listItem(snapshot.data, context),
            ));
  }

  List<Widget> _listItem(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((option) {
      final widgetTemp = ListTile(
        title: Text(option['texto']),
        leading: getIcon(option['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, option['ruta']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
