part of 'preference_bloc.dart';

@immutable
abstract class PreferenceEvent extends Equatable {
  const PreferenceEvent();
}

class LoadPreferenceEvent extends PreferenceEvent {
  @override
  List<Object?> get props => [];
}

class PreferenceChangeEvent extends PreferenceEvent {
  final List<bool> choices;

  const PreferenceChangeEvent({required this.choices});

  @override
  List<Object?> get props => [choices];
}
