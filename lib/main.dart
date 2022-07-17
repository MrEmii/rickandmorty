import 'package:flutter/material.dart';
import 'package:rickandmorty/application/injector.dart';
import 'package:rickandmorty/application/services/get_services.dart';

Future<void> main() async {
  await setupServices();

  runApp(const Injector());
}
