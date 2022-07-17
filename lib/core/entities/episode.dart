import 'package:rickandmorty/core/abstracts/entity.dart';

class Episode extends Entity {
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;

  const Episode({
    required super.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
  });

  factory Episode.fromJson(Map<String, dynamic> map) => Episode(
        id: map["id"],
        name: map["name"],
        airDate: map["air_date"],
        episode: map["episode"],
        characters: List<String>.from(map["characters"]),
      );
}
