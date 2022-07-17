import 'package:rickandmorty/core/types/locations_types.dart';

mixin GetLocationsByUrl{
  Future<LocationsRequest> getLocationsByUrl(String url);
}