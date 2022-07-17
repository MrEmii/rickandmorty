import 'package:rickandmorty/core/abstracts/dto.dart';
import 'package:rickandmorty/core/abstracts/entity.dart';

class EntityDTO<T extends Entity> extends DTO {
  T? entity;

  EntityDTO(super.status, super.message, {this.entity});

  @override
  serialize() {
    throw UnimplementedError();
  }
}
