import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/application/providers/characters_provider.dart';
import 'package:rickandmorty/core/entities/character.dart';
import 'package:rickandmorty/presentation/ui/characters/character_card.dart';
import 'package:rickandmorty/presentation/widgets/entity_list.dart';
import 'package:rickandmorty/presentation/widgets/skeleton.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () => context.read<CharactersProvider>().readMoreCharacters(_scrollController.position.pixels, _scrollController.position.maxScrollExtent),
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = context.watch<CharactersProvider>().characters;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: EntityList<Character>(
        scrollController: _scrollController,
        builder: (_, character) {
          if (character.name == 'ram:placeholder') {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: const SkeletonWidget(),
            );
          }
          return CharacterCard(character: character);
        },
        entities: characters,
      ),
    );
  }
}
