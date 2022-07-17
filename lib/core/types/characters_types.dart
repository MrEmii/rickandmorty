import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/entities/character.dart';

typedef CharactersRequest = EntitiesDTO<List<Character>>;

typedef CharacterRequest = EntityDTO<Character>;
