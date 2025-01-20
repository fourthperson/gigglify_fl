import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/domain/entity/joke.dart';
import 'package:gigglify_fl/domain/use_case/get_saved_jokes_use_case.dart';
import 'package:share_plus/share_plus.dart';

part 'history_state.dart';

part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetSavedJokesUseCase _getSavedJokesUseCase;

  HistoryBloc(this._getSavedJokesUseCase) : super(HistoryLoadingState()) {
    on<ShareHistoryEvent>(_shareJoke);
    on<LoadHistoryEvent>(_loadHistory);
  }

  void _loadHistory(LoadHistoryEvent event, Emitter<HistoryState> emit) {
    emit(HistoryLoadingState());
    List<Joke> jokes = _getSavedJokesUseCase.invoke();
    emit(HistoryLoadedState(jokesList: jokes));
  }

  void _shareJoke(ShareHistoryEvent event, Emitter<HistoryState> emit) {
    Share.share(event.joke.content);
  }
}
