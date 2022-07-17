import 'package:rickandmorty/core/abstracts/base_repository.dart';
import 'package:rickandmorty/core/use_cases/get_character_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_character_by_url.dart';
import 'package:rickandmorty/core/use_cases/get_characters_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_characters_by_url.dart';

abstract class CharactersRepository extends BaseRepository with GetCharacterById, GetCharactersById, GetCharacterByUrl, GetCharactersByUrl {
  const CharactersRepository(super.consumer);
}
