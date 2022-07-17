import 'package:rickandmorty/core/abstracts/entity.dart';
import 'package:rickandmorty/core/model/location_data.dart';

class Character extends Entity {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final List<String> episodes;
  final LocationData origin;
  final LocationData location;

  const Character({required super.id, required this.name, required this.status, required this.species, required this.gender, required this.image, required this.episodes, required this.origin, required this.location});

  factory Character.fromJson(Map<String, dynamic> map) => Character(
        id: map["id"],
        name: map["name"],
        status: map["status"],
        species: map["species"],
        gender: map["gender"],
        image: map["image"],
        location: LocationData.fromJson(map["location"]),
        origin: LocationData.fromJson(map["origin"]),
        episodes: List<String>.from(map["episode"]),
      );
}
