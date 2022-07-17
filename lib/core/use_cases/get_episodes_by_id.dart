import 'package:rickandmorty/core/types/episodes_types.dart';

mixin GetEpisodesById {
  Future<EpisodesRequest> getEpisodesById(String id);
}
