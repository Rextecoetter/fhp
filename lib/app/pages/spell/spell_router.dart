import 'package:fhp/app/core/custom_dio/custom_dio.dart';
import 'package:fhp/app/pages/spell/spell_controller.dart';
import 'package:fhp/app/pages/spell/spell_page.dart';
import 'package:fhp/app/repositories/spell_repository/spell_repository.dart';
import 'package:fhp/app/repositories/spell_repository/spell_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpellRouter {
  SpellRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<SpellRepository>(
            create: (context) => SpellRepositoryImpl(dio: context.read<CustomDio>()),
          ),
          Provider<SpellController>(
            create: (context) => SpellController(context.read()),
          )
        ],
        builder: (context, child) => const SpellPage(),
      );
}
