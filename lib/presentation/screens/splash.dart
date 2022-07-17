import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/application/providers/characters_provider.dart';
import 'package:rickandmorty/application/providers/episodes_provider.dart';
import 'package:rickandmorty/application/providers/locations_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation<double> _animation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);

  @override
  void initState() {
    super.initState();
    _animationController.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.wait([
        context.read<CharactersProvider>().fetchCharacters(),
        context.read<LocationsProvider>().fetchLocations(),
        context.read<EpisodesProvider>().fetchEpisodes(),
        Future.delayed(const Duration(seconds: 2)),
      ]).whenComplete(
        () => _animationController.reverse().then(
              (value) => context.go("/"),
            ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Transform.scale(
                scale: (200 - (200 * _animation.value)).toDouble().clamp(1, 200),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
              );
            },
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
