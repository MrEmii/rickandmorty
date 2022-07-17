import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/application/common/toast_messages.dart';
import 'package:rickandmorty/core/entities/episode.dart';
import 'package:rickandmorty/core/repositories/episodes_repository.dart';
import 'package:rickandmorty/core/types/episodes_types.dart';

class EpisodesProvider extends ChangeNotifier {
  EpisodesRequest? _lastRequest;

  List<Episode> _episodes = [];

  List<Episode> get episodes => _episodes;

  set episodes(List<Episode> value) {
    _episodes = value;
    notifyListeners();
  }

  Future<void> fetchEpisodes() async {
    if (_lastRequest != null && _lastRequest!.requestInfo?.next == null) return;
    _lastRequest = await GetIt.I<EpisodesRepository>().getEpisodesByUrl(_lastRequest?.requestInfo?.next ?? "https://rickandmortyapi.com/api/episode/");

    if (_lastRequest?.status != 200) {
      showErrorToast(_lastRequest?.message ?? "No connection error");
    }

    episodes.addAll(_lastRequest?.entities ?? []);
  }
}
