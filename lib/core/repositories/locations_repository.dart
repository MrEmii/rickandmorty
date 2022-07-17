import 'package:rickandmorty/core/abstracts/base_repository.dart';
import 'package:rickandmorty/core/use_cases/get_location_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_location_by_url.dart';
import 'package:rickandmorty/core/use_cases/get_locations_by_id.dart';
import 'package:rickandmorty/core/use_cases/get_locations_by_url.dart';

abstract class LocationsRepository extends BaseRepository with GetLocationById, GetLocationsByUrl, GetLocationByUrl, GetLocationsById {
  const LocationsRepository(super.consumer);
}
