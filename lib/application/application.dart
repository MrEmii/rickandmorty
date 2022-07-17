import 'package:flutter/material.dart';
import 'package:rickandmorty/application/router/app_routes.dart';
import 'package:rickandmorty/presentation/app_theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRoutes.routes.routeInformationParser,
      routerDelegate:  AppRoutes.routes.routerDelegate,
      routeInformationProvider: AppRoutes.routes.routeInformationProvider,
      theme: AppTheme.lightTheme,
      //TODO: Define theme
    );
  }
}