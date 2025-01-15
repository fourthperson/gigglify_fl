part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {}

class HistoryLoadedState extends HistoryState {
  final List<SavedJoke> jokesList;

  HistoryLoadedState({required this.jokesList});

  @override
  List<Object?> get props => [jokesList];
}

class HistoryLoadingState extends HistoryState {
  @override
  List<Object?> get props => [];
}
