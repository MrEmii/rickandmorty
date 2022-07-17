import 'package:rickandmorty/core/types/locations_types.dart';

mixin GetLocationsById{
  Future<LocationsRequest> getLocationsById(String id);
}