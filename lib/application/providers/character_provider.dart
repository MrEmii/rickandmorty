import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/application/common/toast_messages.dart';
import 'package:rickandmorty/core/abstracts/dto.dart';
import 'package:rickandmorty/core/entities/character.dart';
import 'package:rickandmorty/core/entities/episode.dart';
import 'package:rickandmorty/core/entities/location.dart';
import 'package:rickandmorty/core/repositories/episodes_repository.dart';
import 'package:rickandmorty/core/repositories/locations_repository.dart';
import 'package:rickandmorty/core/types/episodes_types.dart';
import 'package:rickandmorty/core/types/locations_types.dart';

class CharacterProvider extends ChangeNotifier {
  Character? character;
  Location? origin;
  Location? location;
  List<Episode>? episodes;

  final ScrollController scrollController = ScrollController();

  void clear() {
    character = null;
    origin = null;
    location = null;
    episodes = null;
  }

  void setCharacter(Character character) async {
    this.character = character;
    notifyListeners();

    final String episodeIds = character.episodes.map<String>((episode) => episode.split('/').last).toList().join(",");

    List<DTO> responses = await Future.wait([
      GetIt.I<LocationsRepository>().getLocationByUrl(character.origin.url),
      GetIt.I<LocationsRepository>().getLocationByUrl(character.location.url),
      GetIt.I<EpisodesRepository>().getEpisodesById(episodeIds),
    ]);

    LocationRequest? originRequest = responses[0] as LocationRequest;
    LocationRequest? locationRequest = responses[1] as LocationRequest;
    EpisodesRequest? episodeRequests = responses[2] as EpisodesRequest;

    if (responses.any((response) => response.status != 200)) {
      showErrorToast(responses.firstWhere((response) => response.status != 200).message);
    }

    origin = originRequest.entity;
    location = locationRequest.entity;
    episodes = episodeRequests.entities;

    notifyListeners();
  }
}
