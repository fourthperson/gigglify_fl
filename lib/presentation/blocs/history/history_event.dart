part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {}

class LoadHistoryEvent extends HistoryEvent {
  @override
  List<Object?> get props => [];
}

class ShareHistoryEvent extends HistoryEvent {
  final Joke joke;

  ShareHistoryEvent({required this.joke});

  @override
  List<Object?> get props => [joke];
}
