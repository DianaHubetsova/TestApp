part of 'character_bloc.dart';

@immutable
abstract class CharacterState {
  const CharacterState();

}

class CharacterInitial extends CharacterState {}


class CharacterSuccessState extends CharacterState {
  final List<CharacterModel> character;

  const CharacterSuccessState({
    required this.character,
  });
}


