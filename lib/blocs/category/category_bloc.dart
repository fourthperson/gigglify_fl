import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/config/constants.dart';
import 'package:gigglify_fl/repo/category_repo.dart';

part 'category_state.dart';

part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo _categoryRepo;

  CategoryBloc(this._categoryRepo) : super(CategoriesLoadingState()) {
    on<LoadCategoryEvent>(_load);
    on<CategoryChangeEvent>(_change);
  }

  void _load(LoadCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CategoriesLoadingState());
    List<bool> categories = await _categoryRepo.getAllowedCategories();
    emit(CategoriesLoadedState(categories: categories));
  }

  void _change(CategoryChangeEvent event, Emitter<CategoryState> emit) async {
    await _categoryRepo.categoryChanged(event.index, event.value);
    if (event.index == 0 && event.value) {
      for (int i = 1; i < apiRoutes.length; i++) {
        await _categoryRepo.categoryChanged(i, false);
      }
    } else {
      await _categoryRepo.categoryChanged(0, false);
    }
    List<bool> categories = await _categoryRepo.getAllowedCategories();
    emit(CategoriesLoadedState(categories: categories));
  }
}
