import 'package:rickandmorty/core/types/episodes_types.dart';

mixin GetEpisodeById{
  Future<EpisodeRequest> getEpisodeById(int id);
}