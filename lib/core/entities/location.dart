import 'package:rickandmorty/core/abstracts/entity.dart';

class Location extends Entity {
  final String name;
  final String type;
  final String dimension;

  const Location({required super.id, required this.name, required this.type, required this.dimension});

  factory Location.fromJson(Map<String, dynamic> map) => Location(
        id: map["id"],
        name: map["name"],
        type: map["type"],
        dimension: map["dimension"],
      );
}
