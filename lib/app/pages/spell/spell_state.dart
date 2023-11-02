import 'package:equatable/equatable.dart';

import 'package:fhp/app/models/spell_model.dart';

enum SpellStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class SpellState extends Equatable {
  final SpellStateStatus status;
  final List<SpellModel> spellList;

  const SpellState({required this.status, required this.spellList});

  SpellState.inicial()
      : status = SpellStateStatus.initial,
        spellList = [];

  @override
  List<Object?> get props => [status, spellList];

  SpellState copyWith({
    SpellStateStatus? status,
    List<SpellModel>? spellList,
  }) {
    return SpellState(
      status: status ?? this.status,
      spellList: spellList ?? this.spellList,
    );
  }
}
