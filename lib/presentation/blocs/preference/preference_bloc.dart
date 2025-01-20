import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigglify_fl/domain/entity/choice.dart';
import 'package:gigglify_fl/domain/use_case/get_choice_use_case.dart';
import 'package:gigglify_fl/domain/use_case/save_choice_use_case.dart';

part 'preference_state.dart';

part 'preference_event.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final GetChoiceUseCase _getChoiceUseCase;
  final SaveChoiceUseCase _saveChoiceUseCase;

  PreferenceBloc(this._getChoiceUseCase, this._saveChoiceUseCase)
      : super(CategoriesLoadingState()) {
    on<LoadPreferenceEvent>(_load);
    on<PreferenceChangeEvent>(_change);
  }

  void _load(LoadPreferenceEvent event, Emitter<PreferenceState> emit) async {
    emit(CategoriesLoadingState());
    Choice result = await _getChoiceUseCase.invoke();
    emit(PreferenceLoadedState(categories: result.choices));
  }

  void _change(
    PreferenceChangeEvent event,
    Emitter<PreferenceState> emit,
  ) async {
    // todo investigate checking/unchecking bug here
    List<bool> choices = List.from(event.choices, growable: false);
    if (choices[0]) {
      // first one is checked, uncheck all others
      for (int i = 1; i < choices.length; i++) {
        choices[i] = false;
      }
    } else {
      // others checked, uncheck first
      choices[0] = false;
    }
    await _saveChoiceUseCase.invoke(Choice(choices: choices));
    emit(PreferenceLoadedState(categories: choices));
    // List<String> apiRoutes = getIt<List<String>>();
    // await _categoryRepo.categoryChanged(event.index, event.value);
    // if (event.index == 0 && event.value) {
    //   for (int i = 1; i < apiRoutes.length; i++) {
    //     await _categoryRepo.categoryChanged(i, false);
    //   }
    // } else {
    //   await _categoryRepo.categoryChanged(0, false);
    // }
    // List<bool> categories = await _categoryRepo.getAllowedCategories();
    // emit(CategoriesLoadedState(categories: categories));
  }
}
