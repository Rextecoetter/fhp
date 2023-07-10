import 'dart:convert';

class SpellModel {
  String id;
  String name;
  String description;

  SpellModel({required this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  factory SpellModel.fromMap(Map<String, dynamic> map) {
    return SpellModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJason() => jsonEncode(toMap());

  factory SpellModel.fromJson(String source) => SpellModel.fromMap(jsonDecode(source));
}
