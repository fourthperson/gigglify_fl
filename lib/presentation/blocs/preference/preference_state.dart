part of 'preference_bloc.dart';

@immutable
abstract class PreferenceState extends Equatable {}

class CategoriesLoadingState extends PreferenceState {
  @override
  List<Object?> get props => [];
}

class PreferenceLoadedState extends PreferenceState {
  final List<bool> categories;

  PreferenceLoadedState({required this.categories});

  @override
  List<Object?> get props => [categories];
}
