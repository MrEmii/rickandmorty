import 'package:rickandmorty/core/dtos/response/entities_dto.dart';
import 'package:rickandmorty/core/dtos/response/entity_dto.dart';
import 'package:rickandmorty/core/entities/location.dart';

typedef LocationsRequest = EntitiesDTO<List<Location>>;

typedef LocationRequest = EntityDTO<Location>;
