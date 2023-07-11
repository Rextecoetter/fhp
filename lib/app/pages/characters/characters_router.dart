import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/pages/characters/characters_controller.dart';
import 'package:fhp/app/pages/characters/characters_page.dart';
import 'package:fhp/app/repositories/character_repository/character_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/character_repository/character_repository.dart';

class CharactersRouter {
  CharactersRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<CharacterRepository>(
            create: (context) => CharacterRepositoryImpl(
              dio: context.read<CustomDio>(),
            ),
          ),
          Provider(
            create: (context) => CharactersController(context.read()),
          ),
        ],
        child: const CharactersPage(),
      );
}
