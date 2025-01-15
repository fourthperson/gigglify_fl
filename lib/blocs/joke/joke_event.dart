part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent extends Equatable {
  const JokeEvent();
}

class LoadJokeEvent extends JokeEvent {
  @override
  List<Object?> get props => [];
}

class ShareJokeEvent extends JokeEvent {
  final Joke joke;

  const ShareJokeEvent({required this.joke});

  @override
  List<Object?> get props => [joke];
}
