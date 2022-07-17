import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/entities/episode.dart';

typedef EpisodesRequest = EntitiesDTO<List<Episode>>;

typedef EpisodeRequest = EntityDTO<Episode>;
