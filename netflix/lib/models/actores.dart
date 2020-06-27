class Cast {
  // Lista dinamica
  List<Actor> actors = new List();

  // Constructor
  Cast.fromJsonList(List<dynamic> jsonList) {
    // Si la lista llega null, salimos de la funcion
    if (jsonList == null) return;

    // Iteramos los actores que llegan
    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      // Retornamos los actores en la lista creada
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPosterImageActor() {
    return profilePath == null
        ? 'https://thumbs.dreamstime.com/b/omita-el-icono-del-perfil-avatar-placeholder-mujeres-grises-de-la-foto-99724605.jpg'
        : 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
