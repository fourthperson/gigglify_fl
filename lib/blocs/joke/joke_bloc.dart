import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/data/api/joke.dart';
import 'package:gigglify_fl/repo/joke_repo.dart';
import 'package:share_plus/share_plus.dart';

part 'joke_state.dart';
part 'joke_event.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepo _jokeRepo;

  JokeBloc(this._jokeRepo) : super(JokeLoadingSate()) {
    on<LoadJokeEvent>(_loadJoke);
    on<ShareJokeEvent>(_shareJoke);
  }

  void _loadJoke(LoadJokeEvent event, Emitter<JokeState> emit) async {
    emit(JokeLoadingSate());
    Joke? joke = await _jokeRepo.getJoke();
    emit(joke == null ? JokeErrorSate() : JokeLoadedSate(joke: joke));
  }

  void _shareJoke(ShareJokeEvent event, Emitter<JokeState> emit) {
    String text = event.joke.type == 'twopart'
        ? '${event.joke.setup}\n\n${event.joke.delivery}'
        : event.joke.joke ?? '';
    Share.share(text);
  }
}
