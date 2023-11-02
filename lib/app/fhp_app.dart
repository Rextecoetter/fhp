import 'package:fhp/app/core/provider/application_bindings.dart';
import 'package:fhp/app/pages/character_detail/character_detail_router.dart';
import 'package:fhp/app/pages/characters/characters_router.dart';
import 'package:fhp/app/pages/inicial/inicial_page.dart';
import 'package:fhp/app/pages/spell/spell_router.dart';
import 'package:fhp/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class FhpApp extends StatelessWidget {
  const FhpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBindings(
      child: MaterialApp(
        title: 'Harry Potter Flutter App',
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/': (context) => const SplashPage(),
          '/inicial': (context) => const InicialPage(),
          '/characters': (context) => CharactersRouter.page,
          '/character_detail': (context) => CharacterDetailRouter.page,
          '/spells': (context) => SpellRouter.page,
        },
      ),
    );
  }
}
