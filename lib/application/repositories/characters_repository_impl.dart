import 'dart:convert';

import 'package:rickandmorty/core/entities/character.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/model/request_info.dart';
import 'package:rickandmorty/core/repositories/characters_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/types/characters_types.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  const CharactersRepositoryImpl(super.consumer);
  final String charactersUrl = "https://rickandmortyapi.com/api/character/";

  @override
  Future<CharacterRequest> getCharacterById(int id) async {
    http.Response? response = await consumer.get(url: charactersUrl + id.toString());
    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Character character = Character.fromJson(json.decode(response.body));

    return EntityDTO(200, "Character found", entity: character);
  }

  @override
  Future<CharacterRequest> getCharacterByUrl(String url) async {
    http.Response? response = await consumer.get(url: url);
    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Character character = Character.fromJson(json.decode(response.body));

    return EntityDTO(200, "Character found", entity: character);
  }

  @override
  Future<CharactersRequest> getCharactersByUrl(String url) async {
    http.Response? response = await consumer.get(url: url);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    final Map<String, dynamic> result = json.decode(response.body);

    RequestInfo info = RequestInfo.fromMap(result["info"]);
    List<Character> characters = result["results"].map<Character>((dynamic item) => Character.fromJson(item)).toList();

    return EntitiesDTO(200, "Characters found", entities: characters, requestInfo: info);
  }

  @override
  Future<CharactersRequest> getCharactersById(String id) async {
   http.Response? response = await consumer.get(url: charactersUrl + id);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    final List<Map<String, dynamic>> result = json.decode(response.body);

    List<Character> characters = result.map<Character>((dynamic item) => Character.fromJson(item)).toList();

    return EntitiesDTO(200, "Characters found", entities: characters);
  }
}
