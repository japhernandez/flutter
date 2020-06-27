import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/models/pelicula.dart';

class CarteleraProvider {
  String _apiKey = 'a3dd705cd720df2391b7591330a8be23';
  String _url = 'api.themoviedb.org';
  String _language = 'es-Es';

  // Esta variable guardar el numero de paginas que retorna la api
  int _carteleraPages = 0;

  // Esta bandera nos garantiza que no solo se cargue la siguiente pagina
  bool _cargando = false;

  // Esta variable va a guardar el JSON despues de la transformacion
  List<Pelicula> _cartelera = new List();

  // Inicializamos la clase
  final _carteleraStreamController =
      StreamController<List<Pelicula>>.broadcast();

  // Este metodo guarda la data cada que se haga una peticion
  Function(List<Pelicula>) get carteleraSink =>
      _carteleraStreamController.sink.add;

  // Este metodo entrega al Widget todo la data que va necesitando
  Stream<List<Pelicula>> get carteleraStream =>
      _carteleraStreamController.stream;

  // Cierra la conexion a los broadcast que ya no se esten utilizando
  void disposedStream() {
    _carteleraStreamController?.close();
  }

  Future<List<Pelicula>> getCartelera() async {
    // Cuando esta variable este en true y no tiene data, se retorna un
    // array vacio, para que no rompa la aplicacion
    if (_cargando) return [];

    // Despues de la primera carga de la data, esta variable pasa al valor de 1
    // luego sigue aumentando por medio de las llamadas al stream
    _carteleraPages++;

    // Por cada llamado a una pagina nueva se establece a true
    _cargando = true;

    // Configuracion de la url de acuerdo a los parametros que necesita,
    // para devolver la data paginada
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': _carteleraPages
          .toString() // Esta variable se declara como int, pero se debe de castear para pasarla a la url
    });

    // Le pasamos la url a la funcion para transforma la data que llega
    final response = await _getData(url);

    // Agregamos el response a la lista
    // addAll() es un metodo que hace una iteracion por cada elemento que recibe
    _cartelera.addAll(response);

    // Cargamos la lista cada vez que se requiera una pagina nueva
    carteleraSink(_cartelera);

    // Esta bandera interrumpe la carga, solo carga la data de un pagina
    _cargando = false;

    // Retorna la data de la carga inicial, esto solo ocurre una vez
    // por cada renderizado.
    return response;
  }

  // Esta funcion recibe como parametro la url que se va a consumir
  // y hace el proceso de transformacion de la data en un String
  // para pasarla a JSON y asi poder procesarla
  Future<List<Pelicula>> _getData(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }
}
