import 'dart:convert';

import 'package:rickandmorty/core/entities/location.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/model/request_info.dart';
import 'package:rickandmorty/core/repositories/locations_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/types/locations_types.dart';

class LocationsRepositoryImpl extends LocationsRepository {
  const LocationsRepositoryImpl(super.consumer);
  final String locationsUrl = "https://rickandmortyapi.com/api/location/";

  @override
  Future<EntityDTO<Location>> getLocationById(int id) async {
    http.Response? response = await consumer.get(url: locationsUrl + id.toString());
    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Location location = Location.fromJson(json.decode(response.body));

    return EntityDTO(200, "Location found", entity: location);
  }

  @override
  Future<EntityDTO<Location>> getLocationByUrl(String url) async {
    if(url.isEmpty) {
      return EntityDTO(500, "No url");
    }
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return EntityDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntityDTO(response.statusCode, response.body);
    }

    final Location location = Location.fromJson(json.decode(response.body));

    return EntityDTO(200, "Location found", entity: location);
  }

  @override
  Future<EntitiesDTO<List<Location>>> getLocationsByUrl(String url) async {
    http.Response? response = await consumer.get(url: url);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    final Map<String, dynamic> result = json.decode(response.body);

    final RequestInfo info = RequestInfo.fromMap(result["info"]);
    final List<Location> locations = result["results"]
        .map<Location>(
          (dynamic location) => Location.fromJson(location),
        )
        .toList();

    return EntitiesDTO(200, "Locations found", entities: locations, requestInfo: info);
  }

  @override
  Future<LocationsRequest> getLocationsById(String id) async {
    http.Response? response = await consumer.get(url: locationsUrl + id);
    if (response == null) {
      return EntitiesDTO(500, "No response");
    }

    if (response.statusCode != 200) {
      return EntitiesDTO(response.statusCode, response.body);
    }

    final List<Map<String, dynamic>> result = json.decode(response.body);

    final List<Location> locations = result
        .map<Location>(
          (dynamic location) => Location.fromJson(location),
        )
        .toList();

    return EntitiesDTO(200, "Locations found", entities: locations);
  }
}
