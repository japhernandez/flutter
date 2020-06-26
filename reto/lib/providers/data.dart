import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _DataProvider {
  List<dynamic> personajes = [];

  _DataProvider();

  Future<List<dynamic>> extractData() async {
    // 1. Leemos el archivo JSON
    final response = await rootBundle.loadString('data/favoritos.json');
    // 2.0 Nos devuelve un STRING con el contenido del archivo
    // 2.1 Se debe transformar a formato JSON, para dar manejo a su contenido
    Map dataMap = json.decode(response);
    // 3. Guardamos en el List<dynamic> options = [] la data que se transformo a JSON
    List<dynamic> personajes = dataMap['personajes'];
    // 4. Retornamos el Future<List<dynamic>> en formato JSON
    return personajes;
  }
}

final dataProvider = new _DataProvider();
