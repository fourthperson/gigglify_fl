import 'package:gigglify_fl/domain/entity/choice.dart';
import 'package:gigglify_fl/domain/repository/choice_repository.dart';

class SaveChoiceUseCase {
  final ChoiceRepository _choiceRepository;

  SaveChoiceUseCase(this._choiceRepository);

  Future<void> invoke(Choice choices) async {
    await _choiceRepository.setChoice(choices);
  }
}
