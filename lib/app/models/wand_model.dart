import 'dart:convert';

class WandModel {
  final String wood;
  final String core;
  final int? length;
  WandModel({required this.wood, required this.core, this.length});

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'wood': wood,
      'core': core,
    };

    if (length != null) {
      map['length'] = length;
    }

    return map;
  }

  factory WandModel.fromMap(Map<String, dynamic> map) {
    return WandModel(
      wood: map['wood'] ?? '',
      core: map['core'] ?? '',
      length: map['length']?.toInt(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory WandModel.fromJson(String source) => WandModel.fromMap(jsonDecode(source));
}
