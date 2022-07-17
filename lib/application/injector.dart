import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/application/application.dart';
import 'package:rickandmorty/application/providers/character_provider.dart';
import 'package:rickandmorty/application/providers/characters_provider.dart';
import 'package:rickandmorty/application/providers/episodes_provider.dart';
import 'package:rickandmorty/application/providers/global_provider.dart';
import 'package:rickandmorty/application/providers/locations_provider.dart';

class Injector extends StatelessWidget {
  const Injector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
        ChangeNotifierProvider<CharactersProvider>(create: (_) => CharactersProvider()),
        ChangeNotifierProvider<EpisodesProvider>(create: (_) => EpisodesProvider()),
        ChangeNotifierProvider<LocationsProvider>(create: (_) => LocationsProvider()),
        ChangeNotifierProvider<CharacterProvider>(create: (_) => CharacterProvider()),
      ],
      child: const Application(),
    );
  }
}
