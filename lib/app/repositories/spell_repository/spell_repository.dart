import 'package:fhp/app/models/spell_model.dart';

abstract class SpellRepository {
  Future<List<SpellModel>> getAllSpells();
}
