import 'package:fhp/app/pages/spell/spell_state.dart';
import 'package:fhp/app/repositories/spell_repository/spell_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpellController extends Cubit<SpellState> {
  final SpellRepository _spellRepository;

  SpellController(
    this._spellRepository,
  ) : super(SpellState.inicial());

  Future<void> loadSpells() async {
    emit(state.copyWith(status: SpellStateStatus.loading));
    final spellList = await _spellRepository.getAllSpells();
    emit(state.copyWith(status: SpellStateStatus.loaded, spellList: spellList));
  }
}
