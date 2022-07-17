import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/application/providers/character_provider.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late CharacterProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<CharacterProvider>(context, listen: false);

  }

  @override
  void dispose() {
    provider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<CharacterProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.character!.name),
        centerTitle: true,
      ),
      body: Container()
    );
  }
}
