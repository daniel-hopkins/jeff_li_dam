class Brand {
  int id;
  String name;
  // String description;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> map) {
    return Brand(id: map['id'], name: map['name']);
  }
}
