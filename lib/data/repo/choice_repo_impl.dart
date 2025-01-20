import 'package:gigglify_fl/data/source/services/prefs_service.dart';
import 'package:gigglify_fl/domain/entity/choice.dart';
import 'package:gigglify_fl/domain/repository/choice_repository.dart';

class ChoiceRepositoryImpl extends ChoiceRepository {
  final List<String> _apiPaths;
  final PrefsService _prefsService;

  ChoiceRepositoryImpl(this._apiPaths, this._prefsService);

  @override
  Future<Choice> getChoice() async {
    List<bool> choices = List.filled(_apiPaths.length, false);
    int allowedCount = 0;
    for (int i = 0; i < _apiPaths.length; i++) {
      String? value = await _prefsService.getItem(_apiPaths[i]);
      bool allowed = value != null && value == '1';
      choices[i] = allowed;
      allowedCount += allowed ? 1 : 0;
    }
    choices[0] = allowedCount == 0;
    return Choice(choices: choices);
  }

  @override
  Future<void> setChoice(Choice choice) async {
    List<bool> choices = choice.choices;
    for (int i = 0; i < choices.length; i++) {
      await _prefsService.setItem(_apiPaths[i], choices[i] ? '1' : '0');
    }
  }

  @override
  Future<String> getPath() async {
    List<bool> choices = (await getChoice()).choices;

    String path = '';
    for (int i = 0; i < choices.length; i++) {
      if (choices[i]) {
        path += '${_apiPaths[i]},';
      }
    }
    if (path.endsWith(',')) {
      path = path.substring(0, path.length - 1);
    }
    return path.isEmpty ? _apiPaths[0] : path;
  }
}
