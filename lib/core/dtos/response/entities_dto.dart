import 'package:rickandmorty/core/abstracts/dto.dart';
import 'package:rickandmorty/core/abstracts/entity.dart';
import 'package:rickandmorty/core/model/request_info.dart';

class EntitiesDTO<T extends List<Entity>> extends DTO {
  T? entities;
  RequestInfo? requestInfo;

  EntitiesDTO(super.status, super.message, {this.entities, this.requestInfo});

  @override
  serialize() {
    throw UnimplementedError();
  }
}
