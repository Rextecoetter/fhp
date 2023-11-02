import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/models/spell_model.dart';
import 'package:fhp/app/repositories/spell_repository/spell_repository.dart';

class SpellRepositoryImpl extends SpellRepository {
  SpellRepositoryImpl({required this.dio});
  CustomDio dio;

  @override
  Future<List<SpellModel>> getAllSpells() async {
    final List<SpellModel> spellList = [];

    try {
      var result = await dio.get('/spells');

      for (var spell in result.data) {
        SpellModel spellModel = SpellModel.fromMap(spell);
        spellList.add(spellModel);
      }
    } on DioException catch (e, s) {
      log('Erro: Não foi possível buscar magias', error: e, stackTrace: s);
    }

    return spellList;
  }
}
