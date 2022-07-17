import 'package:rickandmorty/core/types/characters_types.dart';

mixin GetCharactersById {
  Future<CharactersRequest> getCharactersById(String id);
}