import 'package:go_router/go_router.dart';
import 'package:rickandmorty/presentation/screens/character.dart';
import 'package:rickandmorty/presentation/screens/characters.dart';
import 'package:rickandmorty/presentation/screens/episodes.dart';
import 'package:rickandmorty/presentation/screens/home.dart';
import 'package:rickandmorty/presentation/screens/locations.dart';
import 'package:rickandmorty/presentation/screens/splash.dart';

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: "/splash",
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: "/",
        builder: (_, __) => const HomeScreen(),
        routes: [
          GoRoute(
            path: "characters",
            builder: (_, __) => const CharactersScreen(),
            routes: [
              GoRoute(
                path: "character",
                builder: (_, __) => const CharacterScreen(),
              ),
            ],
          ),
          GoRoute(
            path: "locations",
            builder: (_, __) => const LocationsScreen(),
          ),
          GoRoute(
            path: "episodes",
            builder: (_, __) => const EpisodesScreen(),
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}
