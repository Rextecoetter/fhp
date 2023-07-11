import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:fhp/app/repositories/character_repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  CharacterRepositoryImpl({required this.dio});

  CustomDio dio;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    final List<CharacterModel> characterList = [];

    var result = await dio.get('/characters');

    for (var character in result.data) {
      var tempCharacter = CharacterModel.fromMap(character);

      print(tempCharacter.name);
    }

    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }
}
