import 'package:gigglify_fl/domain/entity/choice.dart';

abstract class ChoiceRepository {
  Future<Choice> getChoice();

  Future<void> setChoice(Choice choice);

  Future<String> getPath();
}
