import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:fhp/app/repositories/character_repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  CharacterRepositoryImpl({required this.dio});

  CustomDio dio;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final List<CharacterModel> characterList = [];

    try {
      var result = await dio.get('/characters');

      for (var character in result.data) {
        var tempCharacter = CharacterModel.fromMap(character);
        characterList.add(tempCharacter);
      }
    } on DioException catch (e, s) {
      log('Erro', error: e, stackTrace: s);
    }
    return characterList;
  }
}
