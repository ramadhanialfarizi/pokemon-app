class PokemonData {
  String? id;
  String? name;
  String? image;
  String? height;
  String? weight;
  String? spawnTime;
  String? weakness;
  String? spawnChange;

  PokemonData({
    this.id,
    this.name,
    this.image,
    this.height,
    this.weight,
    this.spawnTime,
    this.weakness,
    this.spawnChange,
  });

  // for API
  PokemonData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    image = json['img'];
    weight = json['weight'];
    height = json['height'];
    spawnTime = json['spawn_time'];
    weakness = json['weaknesses'][0];
    spawnChange = json['spawn_chance'].toString();
  }

  // for Database Sqlite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'weakness': weakness,
      'image': image,
    };
  }

  PokemonData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['img'];
    weakness = map['weakness'];
  }
}
