import 'package:gigglify_fl/domain/entity/choice.dart';
import 'package:gigglify_fl/domain/repository/choice_repository.dart';

class GetChoiceUseCase {
  final ChoiceRepository _choiceRepository;

  GetChoiceUseCase(this._choiceRepository);

  Future<Choice> invoke() async {
    return await _choiceRepository.getChoice();
  }
}
