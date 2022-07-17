import 'package:rickandmorty/core/types/locations_types.dart';

mixin GetLocationByUrl {
  Future<LocationRequest> getLocationByUrl(String url);
}