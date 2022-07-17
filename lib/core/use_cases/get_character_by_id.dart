import 'package:rickandmorty/core/types/characters_types.dart';

mixin GetCharacterById {
  Future<CharacterRequest> getCharacterById(int id);
}