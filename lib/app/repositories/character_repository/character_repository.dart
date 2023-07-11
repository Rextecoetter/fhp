import 'package:fhp/app/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getAllCharacters();
}
