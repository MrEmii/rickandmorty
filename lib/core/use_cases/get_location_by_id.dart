import 'package:rickandmorty/core/types/locations_types.dart';

mixin GetLocationById {
  Future<LocationRequest> getLocationById(int id);
}
