import 'package:get_it/get_it.dart';
import 'package:rickandmorty/application/consumers/http_consumer.dart';
import 'package:rickandmorty/application/repositories/characters_repository_impl.dart';
import 'package:rickandmorty/application/repositories/episodes_repository_impl.dart';
import 'package:rickandmorty/application/repositories/locations_repository_impl.dart';
import 'package:rickandmorty/core/abstracts/consumer.dart';
import 'package:rickandmorty/core/repositories/characters_repository.dart';
import 'package:rickandmorty/core/repositories/episodes_repository.dart';
import 'package:rickandmorty/core/repositories/locations_repository.dart';

Future<void> setupServices() async {
  final Consumer consumer = HttpConsumer();
  await consumer.init();

  GetIt.I.registerLazySingleton<CharactersRepository>(() => CharactersRepositoryImpl(consumer));
  GetIt.I.registerLazySingleton<EpisodesRepository>(() => EpisodesRepositoryImpl(consumer));
  GetIt.I.registerLazySingleton<LocationsRepository>(() => LocationsRepositoryImpl(consumer));
}
