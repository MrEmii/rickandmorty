import 'dart:convert';

import 'package:rickandmorty/core/entities/episode.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/model/request_info.dart';
import 'package:rickandmorty/core/repositories/episodes_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/types/episodes_types.dart';

class EpisodesRepositoryImpl extends EpisodesRepository {
  const EpisodesRepositoryImpl(super.consumer);

  final String episodesUrl = "https://rickandmortyapi.com/api/episode/";

  @override
  Future<EntityDTO<Episode>> getEpisodeById(int id) async {
    http.Response? response = await consumer.get(url: episodesUrl + id.toString());
    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Episode episode = Episode.fromJson(json.decode(response.body));

    return EntityDTO(200, "Episode found", entity: episode);
  }

  @override
  Future<EntityDTO<Episode>> getEpisodeByUrl(String url) async {
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Episode episode = Episode.fromJson(json.decode(response.body));

    return EntityDTO(200, "Episode found", entity: episode);
  }

  @override
  Future<EntitiesDTO<List<Episode>>> getEpisodesByUrl(String url) async {
    http.Response? response = await consumer.get(url: url);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    final Map<String, dynamic> result = json.decode(response.body);

    RequestInfo info = RequestInfo.fromMap(result["info"]);
    List<Episode> episodes = result["results"].map<Episode>((dynamic item) => Episode.fromJson(item)).toList();

    return EntitiesDTO(200, "Episodes found", entities: episodes, requestInfo: info);
  }

  @override
  Future<EpisodesRequest> getEpisodesById(String id) async {
    http.Response? response = await consumer.get(url: episodesUrl + id);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    dynamic result = json.decode(response.body);
    List<Episode> episodes;

    if (result is List) {
      episodes = result.map<Episode>((dynamic item) => Episode.fromJson(item)).toList();
    }else{
      episodes = [Episode.fromJson(result)];
    }

    return EntitiesDTO(200, "Episodes found", entities: episodes);
  }
}
