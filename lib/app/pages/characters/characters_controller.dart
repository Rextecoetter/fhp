import 'package:bloc/bloc.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:fhp/app/pages/characters/character_state.dart';

import '../../repositories/character_repository/character_repository.dart';

class CharactersController extends Cubit<CharacterState> {
  final CharacterRepository _characterRepository;

  CharactersController(
    this._characterRepository,
  ) : super(const CharacterState.inicial());

  Future<void> loadCharacters(String? param) async {
    if (param == null) {
      emit(state.copyWith(status: CharacterStateStatus.loading));
      final characters = await _characterRepository.getAllCharacters();
      emit(state.copyWith(status: CharacterStateStatus.loaded, characters: characters));
    }

    if (param != null && param.toLowerCase().contains('gryffindor')) {
      emit(state.copyWith(status: CharacterStateStatus.loadingGryffindor));
      final characters = await _characterRepository.getAllCharacters();
      final filtered = byHouse(param, characters);
      emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
    }
  }

  void getFiltered({required List<CharacterModel> characterModelList, required String filter}) {
    if (filter.isEmpty) {
      loadCharacters(null);
      return;
    }

    final List<CharacterModel> tempList = [];
    emit(state.copyWith(status: CharacterStateStatus.loading));
    for (var characterModel in characterModelList) {
      if (characterModel.name.toLowerCase().contains(filter.toLowerCase())) {
        tempList.add(characterModel);
      }
    }
    emit(state.copyWith(status: CharacterStateStatus.loaded, characters: tempList));
  }

  List<CharacterModel> byHouse(String house, List<CharacterModel> characters) {
    List<CharacterModel> filtered = [];

    for (var character in characters) {
      if (character.house.toLowerCase().contains(house.toLowerCase())) {
        filtered.add(character);
      }
    }

    return filtered;
  }

  // void getFilteredByHouse({required List<CharacterModel> characterModelList, required String house}) {
  //   if (house.isEmpty) {
  //     loadCharacters();
  //     return;
  //   }

  //   final List<CharacterModel> tempList = [];
  //   emit(state.copyWith(status: CharacterStateStatus.loading));
  //   for (var characterModel in characterModelList) {
  //     if (characterModel.house.toLowerCase().contains(house.toLowerCase())) {
  //       tempList.add(characterModel);
  //     }
  //   }
  //   emit(state.copyWith(status: CharacterStateStatus.loaded, characters: tempList));
  // }
}
