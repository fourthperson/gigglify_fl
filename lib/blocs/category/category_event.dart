part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadCategoryEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class CategoryChangeEvent extends CategoryEvent {
  final int index;
  final bool value;

  const CategoryChangeEvent({required this.index, required this.value});

  @override
  List<Object?> get props => [index, value];
}
