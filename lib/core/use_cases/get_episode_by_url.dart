import 'package:rickandmorty/core/types/episodes_types.dart';

mixin GetEpisodeByUrl{
  Future<EpisodeRequest> getEpisodeByUrl(String url);
}