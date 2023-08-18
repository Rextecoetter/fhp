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

    if (param != null) {
      if (param.toLowerCase().contains('gryffindor')) {
        emit(state.copyWith(status: CharacterStateStatus.loadingGryffindor));
        final characters = await _characterRepository.getAllCharacters();
        final filtered = listByHouse(param, characters);
        emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
      }

      if (param.toLowerCase().contains('slytherin')) {
        emit(state.copyWith(status: CharacterStateStatus.loadingSlytherin));
        final characters = await _characterRepository.getAllCharacters();
        final filtered = listByHouse(param, characters);
        emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
      }

      if (param.toLowerCase().contains('hufflepuff')) {
        emit(state.copyWith(status: CharacterStateStatus.loadingHufflePuff));
        final characters = await _characterRepository.getAllCharacters();
        final filtered = listByHouse(param, characters);
        emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
      }

      if (param.toLowerCase().contains('ravenclaw')) {
        emit(state.copyWith(status: CharacterStateStatus.loadingRavenClaw));
        final characters = await _characterRepository.getAllCharacters();
        final filtered = listByHouse(param, characters);
        emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
      }

      if (param.toLowerCase().contains('staff')) {
        emit(state.copyWith(status: CharacterStateStatus.loading));
        final characters = await _characterRepository.getAllCharacters();
        final filtered = listByStaff(characters);
        emit(state.copyWith(status: CharacterStateStatus.loaded, characters: filtered));
      }
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

  List<CharacterModel> listByHouse(String house, List<CharacterModel> characters) {
    List<CharacterModel> filtered = [];
    for (var character in characters) {
      if (character.house.toLowerCase().contains(house.toLowerCase())) {
        filtered.add(character);
      }
    }
    return filtered;
  }

  List<CharacterModel> listByStaff(List<CharacterModel> characters) {
    List<CharacterModel> filtered = [];
    for (var character in characters) {
      if (character.hogwartsStaff) {
        filtered.add(character);
      }
    }
    return filtered;
  }
}
