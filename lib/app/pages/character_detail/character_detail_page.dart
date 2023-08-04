import 'package:fhp/app/pages/character_detail/character_detail_controller.dart';
import 'package:fhp/app/pages/character_detail/chcaracter_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/helper/loader.dart';
import '../../core/ui/helper/messages.dart';
import '../../core/ui/style/colors_styles.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/default_background.jpg'), fit: BoxFit.fitHeight),
        ),
        child: BlocConsumer<CharacterDetailController, ChcaracterDetailState>(
          listener: (context, state) {
            switch (state.status) {
              case CharacterDetailStateStatus.loading:
                showLoader(ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold);
              case _:
                hideLoader();
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                title: Text(state.character?.name ?? ''),
              ),
            );
          },
        ));
  }
}
