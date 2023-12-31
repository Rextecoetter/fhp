import 'package:bloc/bloc.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/models/character_model.dart';

import 'package:fhp/app/pages/character_detail/character_detail_state.dart';
import 'package:flutter/material.dart';

class CharacterDetailController extends Cubit<CharacterDetailState> {
  //final CharacterRepository _characterRepository;
  CharacterModel? characterModel;
  Color? colorA;
  Color? colorB;
  Color? colorC;
  Color? colorD;

  CharacterDetailController(
      //this._characterRepository,
      )
      : super(const CharacterDetailState.inicial());

  void initializing(CharacterModel characterModel) {
    emit(state.copyWith(status: CharacterDetailStateStatus.loading));
    this.characterModel = characterModel;

    if (characterModel.image.isEmpty) {
      this.characterModel = characterModel.copyWith(
          image:
              'https://img.freepik.com/fotos-gratis/fundo-preto-antigo-textura-do-grunge-papel-de-parede-escuro-quadro-negro-quadro-negro-parede-da-sala_1258-28312.jpg');
    }

    colorA = ColorsStyles.i.hogwartsBlack;
    colorB = ColorsStyles.i.hogwartsGold;
    colorC = colorA;
    colorD = colorB;

    if (!characterModel.hogwartsStaff) {
      switch (characterModel.house.toLowerCase()) {
        case 'gryffindor':
          colorA = ColorsStyles.i.griffindorRed;
          colorB = ColorsStyles.i.griffindorGold;
          colorC = ColorsStyles.i.griffindorDarkRed;
          colorD = ColorsStyles.i.griffindorYellow;
        case 'slytherin':
          colorA = ColorsStyles.i.slytherinDarkGreen;
          colorB = ColorsStyles.i.slytherinDarkSilver;
          colorC = ColorsStyles.i.slytherinGreen;
          colorD = ColorsStyles.i.slytherinLightSilver;
        case 'ravenclaw':
          colorA = ColorsStyles.i.ravenClawDarkBlue;
          colorB = ColorsStyles.i.ravenClawGold;
          colorC = ColorsStyles.i.ravenClawBlue;
          colorD = ColorsStyles.i.ravenClawGrey;
        case 'hufflepuff':
          colorA = ColorsStyles.i.hufflepuffLightYellow;
          colorB = ColorsStyles.i.hufflepuffDarkBrown;
          colorC = ColorsStyles.i.hufflepuffLghtBrown;
          colorD = ColorsStyles.i.hufflepuffYellow;
      }
    }
    emit(state.copyWith(
      status: CharacterDetailStateStatus.loaded,
      colorA: colorA,
      colorB: colorB,
      colorC: colorC,
      colorD: colorD,
      character: this.characterModel,
    ));
  }
}
