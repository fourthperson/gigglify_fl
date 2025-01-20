import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final List<bool> choices;

  const Choice({required this.choices});

  @override
  List<Object?> get props => [choices];
}
