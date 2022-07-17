import 'package:rickandmorty/core/types/characters_types.dart';

mixin GetCharactersByUrl {
  Future<CharactersRequest> getCharactersByUrl(String url);

}