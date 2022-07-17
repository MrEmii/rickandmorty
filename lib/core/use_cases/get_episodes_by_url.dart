import 'package:rickandmorty/core/types/episodes_types.dart';

mixin GetEpisodesByUrl {
  Future<EpisodesRequest> getEpisodesByUrl(String url);
}
