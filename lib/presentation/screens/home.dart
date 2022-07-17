import 'package:flutter/material.dart';
import 'package:rickandmorty/presentation/ui/home/home_screen_item.dart';
import 'package:rickandmorty/presentation/widgets/noglow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.fitHeight,
          height: 40,
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      ),
      body: ScrollConfiguration(
        behavior: const NoGlowList(),
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          crossAxisCount: 2,
          primary: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: const [
            HomeScreenItem(
              title: 'Characters',
              subtitle: 'View all characters, search by name or species and more.',
              icon: Icons.person,
              path: "/characters",
              color: Color(0xff3d405b),
            ),
            HomeScreenItem(
              title: 'Episodes',
              subtitle: 'View all episodes, search by name or season and more.',
              icon: Icons.tv,
              path: "/episodes",
              color: Color(0xffe07a5f),
            ),
            HomeScreenItem(
              title: 'Locations',
              subtitle: 'View all locations, search by name and more.',
              icon: Icons.location_on,
              path: "/locations",
              color: Color(0xff81b29a),
            ),
          ],
        ),
      ),
    );
  }
}
