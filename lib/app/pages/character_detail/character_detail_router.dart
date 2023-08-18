import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/pages/character_detail/character_detail_controller.dart';
import 'package:fhp/app/pages/character_detail/character_detail_page.dart';
import 'package:fhp/app/repositories/character_repository/character_repository.dart';
import 'package:fhp/app/repositories/character_repository/character_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterDetailRouter {
  CharacterDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<CharacterRepository>(
            create: (context) => CharacterRepositoryImpl(dio: context.read<CustomDio>()),
          ),
          Provider<CharacterDetailController>(
            create: (context) => CharacterDetailController(context.read()),
          ),
        ],
        builder: (context, child) => const CharacterDetailPage(),
      );
}
