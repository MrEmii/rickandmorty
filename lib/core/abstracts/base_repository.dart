import 'package:rickandmorty/core/abstracts/consumer.dart';

abstract class BaseRepository {
  final Consumer consumer;

  const BaseRepository(this.consumer);
}