part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoriesLoadingState extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoadedState extends CategoryState {
  final List<bool> categories;

  CategoriesLoadedState({required this.categories});

  @override
  List<Object?> get props => [categories];
}
