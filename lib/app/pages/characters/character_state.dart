import 'package:equatable/equatable.dart';

import 'package:fhp/app/models/character_model.dart';

enum CharacterStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class CharacterState extends Equatable {
  final CharacterStateStatus status;
  final List<CharacterModel> characters;
  const CharacterState({
    required this.status,
    required this.characters,
  });

  const CharacterState.inicial()
      : status = CharacterStateStatus.initial,
        characters = const [];

  @override
  List<Object> get props => [status, characters];

  CharacterState copyWith({
    CharacterStateStatus? status,
    List<CharacterModel>? characters,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
    );
  }
}
