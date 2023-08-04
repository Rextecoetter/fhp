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
          Provider<CharacterDetailController>(
            create: (context) => CharacterDetailController(context.read()),
          ),
          Provider<CharacterRepository>(
            create: (context) => CharacterRepositoryImpl(dio: context.read()),
          )
        ],
        builder: (context, child) => const CharacterDetailPage(),
      );
}
