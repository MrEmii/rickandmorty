import 'package:rickandmorty/core/abstracts/dto.dart';

abstract class Consumer<T> {
  Future<void> init();
  Future<T?> get({required String url});
  Future<T?> post({required String url, required DTO body});
}