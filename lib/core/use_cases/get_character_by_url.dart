import 'package:rickandmorty/core/types/characters_types.dart';

mixin GetCharacterByUrl {
  Future<CharacterRequest> getCharacterByUrl(String url);
}