import 'package:rickandmorty/core/abstracts/base_repository.dart';
import 'package:rickandmorty/core/use_cases/get_episode_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_episode_by_url.dart';
import 'package:rickandmorty/core/use_cases/get_episodes_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_episodes_by_url.dart';

abstract class EpisodesRepository extends BaseRepository with GetEpisodeById, GetEpisodesById, GetEpisodeByUrl, GetEpisodesByUrl {
  const EpisodesRepository(super.consumer);
}
