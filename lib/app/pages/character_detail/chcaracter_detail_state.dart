import 'package:equatable/equatable.dart';

import 'package:fhp/app/models/character_model.dart';

enum CharacterDetailStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ChcaracterDetailState extends Equatable {
  final CharacterDetailStateStatus status;
  final CharacterModel? character;

  const ChcaracterDetailState({required this.status, this.character});

  @override
  List<Object?> get props => [status, character];

  const ChcaracterDetailState.inicial()
      : status = CharacterDetailStateStatus.initial,
        character = null;

 

  ChcaracterDetailState copyWith({
    CharacterDetailStateStatus? status,
    CharacterModel? character,
  }) {
    return ChcaracterDetailState(
      status: status ?? this.status,
      character: character ?? this.character,
    );
  }
}
