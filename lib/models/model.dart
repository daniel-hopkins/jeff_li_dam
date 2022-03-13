class Model {
  int id;
  String name;
  // String description;

  Model({required this.id, required this.name});

  factory Model.fromJson(Map<String, dynamic> map) {
    return Model(id: map['id'], name: map['name']);
  }
}
