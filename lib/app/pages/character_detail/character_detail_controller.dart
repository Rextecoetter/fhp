import 'package:bloc/bloc.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/models/character_model.dart';

import 'package:fhp/app/pages/character_detail/character_detail_state.dart';
import 'package:fhp/app/repositories/character_repository/character_repository.dart';
import 'package:flutter/material.dart';

class CharacterDetailController extends Cubit<CharacterDetailState> {
  final CharacterRepository _characterRepository;
  CharacterModel? characterModel;
  Color? colorA;
  Color? colorB;

  CharacterDetailController(
    this._characterRepository,
  ) : super(const CharacterDetailState.inicial());

  void initializing(CharacterModel characterModel) {
    emit(state.copyWith(status: CharacterDetailStateStatus.loading));
    this.characterModel = characterModel;

    if (!characterModel.hogwartsStaff) {
      switch (characterModel.house.toLowerCase()) {
        case 'gryffindor':
          colorA = ColorsStyles.i.griffindorRed;
          colorB = ColorsStyles.i.griffindorGold;
        case 'slytherin':
          colorA = ColorsStyles.i.slytherinDarkGreen;
          colorB = ColorsStyles.i.slytherinDarkSilver;
        case 'ravenclaw':
          colorA = ColorsStyles.i.ravenClawDarkBlue;
          colorB = ColorsStyles.i.ravenClawGold;
        case 'hufflepuff':
          colorA = ColorsStyles.i.hufflepuffLightYellow;
          colorB = ColorsStyles.i.hufflepuffDarkBrown;
      }
    } else {
      colorA = ColorsStyles.i.hogwartsBlack;
      colorB = ColorsStyles.i.hogwartsGold;
    }
    emit(state.copyWith(
        status: CharacterDetailStateStatus.loaded, colorA: colorA, colorB: colorB, character: characterModel));
  }
}
