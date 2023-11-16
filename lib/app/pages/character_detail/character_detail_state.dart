import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:fhp/app/models/character_model.dart';

enum CharacterDetailStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class CharacterDetailState extends Equatable {
  final CharacterDetailStateStatus status;
  final CharacterModel? character;
  final Color? colorA;
  final Color? colorB;
  final Color? colorC;
  final Color? colorD;

  const CharacterDetailState(
      {required this.status, this.character, this.colorA, this.colorB, this.colorC, this.colorD});

  @override
  List<Object?> get props => [status, character, colorA, colorB, colorC, colorD];

  const CharacterDetailState.inicial()
      : status = CharacterDetailStateStatus.initial,
        character = null,
        colorA = null,
        colorB = null,
        colorC = null,
        colorD = null;

  CharacterDetailState copyWith({
    CharacterDetailStateStatus? status,
    CharacterModel? character,
    Color? colorA,
    Color? colorB,
    Color? colorC,
    Color? colorD,
  }) {
    return CharacterDetailState(
      status: status ?? this.status,
      character: character ?? this.character,
      colorA: colorA ?? this.colorA,
      colorB: colorB ?? this.colorB,
      colorC: colorC ?? this.colorC,
      colorD: colorD ?? this.colorD,
    );
  }
}
