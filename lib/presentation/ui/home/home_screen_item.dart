import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/presentation/app_theme.dart';

class HomeScreenItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String path;
  final Color color;

  const HomeScreenItem({super.key, required this.title, required this.subtitle, required this.icon, required this.path, required this.color});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push(path),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -50,
                  right: -50,
                  child: Icon(icon, color: Colors.white30, size: 220),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subtitle,
                        softWrap: true,
                        style: textTheme.subtitle1?.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
