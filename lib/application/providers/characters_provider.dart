import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/application/common/toast_messages.dart';
import 'package:rickandmorty/core/entities/character.dart';
import 'package:rickandmorty/core/model/location_data.dart';
import 'package:rickandmorty/core/repositories/characters_repository.dart';
import 'package:rickandmorty/core/types/characters_types.dart';

Character placeholderCharacter = Character(id: 0, name: 'ram:placeholder', image: '', species: '', status: '', location: LocationData("", ""), origin: LocationData("", ""), episodes: [], gender: '');

class CharactersProvider extends ChangeNotifier {
  CharactersRequest? _lastRequest;

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  bool isLoading = false;

  set characters(List<Character> value) {
    _characters = value;
    notify();
  }

  Future<void> fetchCharacters() async {
    if (_lastRequest != null && _lastRequest!.requestInfo?.next == null || isLoading) return;

    isLoading = true;

    int count = (_characters.length + 10).clamp(_characters.length, _lastRequest?.requestInfo?.count ?? 10);
    characters.addAll(List.generate(count, (index) => placeholderCharacter));
    notify();
    await Future.delayed(Duration(seconds: 5));

    _lastRequest = await GetIt.I<CharactersRepository>().getCharactersByUrl(
      _lastRequest?.requestInfo?.next ?? "https://rickandmortyapi.com/api/character/",
    );

    isLoading = false;

    if (_lastRequest?.status != 200) {
      showErrorToast(_lastRequest?.message ?? "No connection error");
    }

    characters.replaceRange(_characters.length - count, _characters.length, _lastRequest?.entities ?? []);
    notify();
  }

  readMoreCharacters(double pixels, double maxScrollExtent) {
    if (pixels >= maxScrollExtent) {
      fetchCharacters();
    }
  }

  void notify() {
    if (hasListeners) {
      notifyListeners();
    }
  }
}
