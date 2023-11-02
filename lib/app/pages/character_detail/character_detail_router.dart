import 'package:fhp/app/pages/character_detail/character_detail_controller.dart';
import 'package:fhp/app/pages/character_detail/character_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterDetailRouter {
  CharacterDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          // Provider<CharacterRepository>(
          //   create: (context) => CharacterRepositoryImpl(dio: context.read<CustomDio>()),
          // ),
          Provider<CharacterDetailController>(
            create: (context) => CharacterDetailController(),
          ),
        ],
        builder: (context, child) => const CharacterDetailPage(),
      );
}
