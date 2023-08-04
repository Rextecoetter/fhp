import 'package:bloc/bloc.dart';
import 'package:fhp/app/models/character_model.dart';

import 'package:fhp/app/pages/character_detail/chcaracter_detail_state.dart';
import 'package:fhp/app/repositories/character_repository/character_repository.dart';

class CharacterDetailController extends Cubit<ChcaracterDetailState> {
  final CharacterRepository _characterRepository;

  CharacterDetailController(
    this._characterRepository,
  ) : super(const ChcaracterDetailState.inicial());

  void getCharacter(int id) async {
    emit(state.copyWith(status: CharacterDetailStateStatus.loading));
    CharacterModel? characterModel = await _characterRepository.getCharacter(id);

    if (characterModel == null) {
      emit(state.copyWith(status: CharacterDetailStateStatus.error));
    } else {
      emit(state.copyWith(status: CharacterDetailStateStatus.loaded, character: characterModel));
    }
  }
}
