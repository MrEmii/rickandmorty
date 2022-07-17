import 'package:flutter/material.dart';
import 'package:rickandmorty/core/abstracts/entity.dart';
import 'package:rickandmorty/presentation/widgets/noglow.dart';

class EntityList<T extends Entity> extends StatelessWidget {
  final ScrollController scrollController;
  final Widget Function(BuildContext context, T item) builder;
  final List<T> entities;

  const EntityList({Key? key, required this.scrollController,  required this.builder, required this.entities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const NoGlowList(),
      child: Scrollbar(
        controller: scrollController,
        interactive: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: entities.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemExtent: 86,
          itemBuilder: (context, index) {
            T character = entities[index];
            return builder(context, character);
          },
        ),
      ),
    );
  }
}
