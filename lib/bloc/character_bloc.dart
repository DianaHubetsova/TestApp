import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/repository/character_repository.dart';

import '../models/character_model.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  int page = 1;
  bool isFetching = false;
final CharacterServiceImplementation dataRepository;

  CharacterBloc({required this.dataRepository}) : super(CharacterInitial());

  void fetch() {
    isFetching = true;
    add(const CharacterFetchEvent());
  }

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is CharacterFetchEvent) {
      try {
        isFetching = true;
        final response = await dataRepository.getAllCharacters(page);
        isFetching = false;
        yield CharacterSuccessState(
          character: response.toList(),
        );
        page++;
      } on Exception catch (exc) {
        isFetching = false;
      }
    }
  }

}
