import 'package:equatable/equatable.dart';

class NoParams {}

class TemplateParams {}

class PokemonParams extends Equatable {
  final String id;
  const PokemonParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
