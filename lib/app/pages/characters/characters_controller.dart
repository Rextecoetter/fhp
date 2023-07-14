import 'package:bloc/bloc.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:fhp/app/pages/characters/character_state.dart';

import '../../repositories/character_repository/character_repository.dart';

class CharactersController extends Cubit<CharacterState> {
  final CharacterRepository _characterRepository;

  CharactersController(
    this._characterRepository,
  ) : super(const CharacterState.inicial());

  Future<void> loadCharacters() async {
    emit(state.copyWith(status: CharacterStateStatus.loading));
    final characters = await _characterRepository.getAllCharacters();
    emit(state.copyWith(status: CharacterStateStatus.loaded, characters: characters));
  }

  void getFiltered({required List<CharacterModel> characterModelList, required filter}) {
    var tempList = [];
    emit(state.copyWith(status: CharacterStateStatus.loading));
    for (var characterModel in characterModelList) {
      if (characterModel.name.contains(filter)) {
        tempList.add(characterModel);
      }
    }
  }
}
