import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/data/db/schemas.dart';
import 'package:gigglify_fl/repo/joke_repo.dart';
import 'package:share_plus/share_plus.dart';

part 'history_state.dart';
part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final JokeRepo _jokeRepo;

  HistoryBloc(this._jokeRepo) : super(HistoryLoadingState()) {
    on<ShareHistoryEvent>(_shareJoke);
    on<LoadHistoryEvent>(_loadHistory);
  }

  void _loadHistory(LoadHistoryEvent event, Emitter<HistoryState> emit) {
    emit(HistoryLoadingState());
    List<SavedJoke> jokes = _jokeRepo.savedJokes();
    emit(HistoryLoadedState(jokesList: jokes));
  }

  void _shareJoke(ShareHistoryEvent event, Emitter<HistoryState> emit) {
    Share.share(event.joke.joke);
  }
}
