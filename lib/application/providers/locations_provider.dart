import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/application/common/toast_messages.dart';
import 'package:rickandmorty/core/entities/location.dart';
import 'package:rickandmorty/core/repositories/locations_repository.dart';
import 'package:rickandmorty/core/types/locations_types.dart';

class LocationsProvider extends ChangeNotifier {
  LocationsRequest? _lastRequest;

  List<Location> _locations = [];

  List<Location> get locations => _locations;

  set locations(List<Location> value) {
    _locations = value;
    notifyListeners();
  }

  Future<void> fetchLocations() async {
    if (_lastRequest != null && _lastRequest!.requestInfo?.next == null) return;
    _lastRequest = await GetIt.I<LocationsRepository>().getLocationsByUrl(_lastRequest?.requestInfo?.next ?? "https://rickandmortyapi.com/api/location/");

    if (_lastRequest?.status != 200) {
      showErrorToast(_lastRequest?.message ?? "No connection error");
    }

    locations.addAll(_lastRequest?.entities ?? []);
  }
}
