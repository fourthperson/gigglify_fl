part of 'joke_bloc.dart';

@immutable
abstract class JokeState extends Equatable {}

class JokeLoadingSate extends JokeState {
  @override
  List<Object?> get props => [];
}

class JokeErrorSate extends JokeState {
  @override
  List<Object?> get props => [];
}

class JokeLoadedSate extends JokeState {
  final Joke joke;

  JokeLoadedSate({required this.joke});

  @override
  List<Object?> get props => [joke];
}
