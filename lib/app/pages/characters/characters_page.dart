import 'package:fhp/app/core/ui/helper/loader.dart';
import 'package:fhp/app/core/ui/style/button_styles.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/core/ui/widgets/app_default_button.dart';
import 'package:fhp/app/pages/characters/character_state.dart';
import 'package:fhp/app/pages/characters/characters_controller.dart';
import 'package:fhp/app/pages/characters/widgets/character_tile.dart';
import 'package:fhp/app/pages/characters/widgets/modal_botton_sheet_filter.dart';
import 'package:fhp/app/pages/characters/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/helper/messages.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> with Loader, Messages {
  TextEditingController characterNameEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharactersController>().loadCharacters();
    });
  }

  @override
  void dispose() {
    characterNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/default_background.jpg'), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Personagens',
            style: TextStyles.i.textTitleLabel.copyWith(color: ColorsStyles.i.hogwartsBlack),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: BlocConsumer<CharactersController, CharacterState>(
              listener: (context, state) {
                switch (state.status) {
                  case CharacterStateStatus.loading:
                    showLoader(ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold);
                  case CharacterStateStatus.loadingGryffindor:
                    showLoader(ColorsStyles.i.griffindorRed, ColorsStyles.i.griffindorGold);
                  case CharacterStateStatus.loadingSlytherin:
                    showLoader(ColorsStyles.i.slytherinDarkGreen, ColorsStyles.i.slytherinLightSilver);
                  case CharacterStateStatus.loadingRavenClaw:
                    showLoader(ColorsStyles.i.ravenClawDarkBlue, ColorsStyles.i.ravenClawGold);
                  case CharacterStateStatus.loadingHufflePuff:
                    showLoader(ColorsStyles.i.hufflepuffYellow, ColorsStyles.i.hufflepuffDarkBrown);
                  case _:
                    hideLoader();
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Form(
                      key: formKey,
                      child: SearchTextFormField(
                        tec: characterNameEC,
                        characterModelList: state.characters,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return CharacterTile(characterName: state.characters[index].name);
                      },
                    )),
                    Builder(
                      builder: (context) {
                        return AppDefaultButton(
                          style: ButtonStyles.i.hogwartsButton,
                          label: 'Filtro',
                          onPressed: () {
                            showModalBottomSheet(
                              useRootNavigator: true,
                              backgroundColor: ColorsStyles.i.hogwartsGold.withAlpha(80),
                              context: context,
                              builder: (context) {
                                return ModalBottonSheetFilter(state: state);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
