import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/use_case/get_joke_use_case.dart';
import 'package:gigglify_fl/domain/use_case/save_joke_use_case.dart';
import 'package:share_plus/share_plus.dart';

part 'joke_state.dart';

part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final GetJokeUseCase _getJokeUseCase;
  final SaveJokeUseCase _saveJokeUseCase;

  JokeBloc(this._getJokeUseCase, this._saveJokeUseCase)
      : super(
          JokeLoadingSate(),
        ) {
    on<LoadJokeEvent>(_loadJoke);
    on<ShareJokeEvent>(_shareJoke);
  }

  void _loadJoke(LoadJokeEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoadingSate());
    Joke? joke = await _getJokeUseCase.invoke();
    if (joke == null) {
      emit(JokeErrorSate());
    } else {
      _saveJokeUseCase.invoke(joke);
      emit(JokeLoadedSate(joke: joke));
    }
  }

  void _shareJoke(ShareJokeEvent event, Emitter<JokeState> emit) {
    Share.share(event.joke.content);
  }
}
