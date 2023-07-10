import 'dart:convert';

import 'package:fhp/app/models/wand_model.dart';

class CharacterModel {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String? dateOfBirth;
  final int? yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final WandModel wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final List<String> alternateActors;
  final bool alive;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'alternate_names': alternateNames,
      'species': species,
      'gender': gender,
      'house': house,
      'wizard': wizard,
      'ancestry': ancestry,
      'eyeColour': eyeColour,
      'hairColour': hairColour,
      'wand': wand.toMap(),
      'patronus': patronus,
      'hogwartsStudent': hogwartsStudent,
      'hogwartsStaff': hogwartsStaff,
      'actor': actor,
      'alternate_actors': alternateActors,
      'alive': alive,
      'image': image,
    };

    if (dateOfBirth != null) {
      map['dateOfBirth'] = dateOfBirth;
    }

    if (yearOfBirth != null) {
      map['yearOfBirth'] = yearOfBirth;
    }

    return map;
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      alternateNames: List<String>.from(map['alternateNames']),
      species: map['species'] ?? '',
      gender: map['gender'] ?? '',
      house: map['house'] ?? '',
      wizard: map['wizard'] ?? false,
      ancestry: map['ancestry'] ?? '',
      eyeColour: map['eyeColour'] ?? '',
      hairColour: map['hairColour'] ?? '',
      wand: WandModel.fromMap(map['wand']),
      patronus: map['patronus'] ?? '',
      hogwartsStudent: map['hogwartsStudent'] ?? false,
      hogwartsStaff: map['hogwartsStaff'] ?? false,
      actor: map['actor'] ?? '',
      alternateActors: List<String>.from(map['alternateActors']),
      alive: map['alive'] ?? false,
      image: map['image'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory CharacterModel.fomJason(String source) => CharacterModel.fromMap(jsonDecode(source));
}
