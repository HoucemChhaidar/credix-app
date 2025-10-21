import 'package:credix_app/app/app.dart';
import 'package:credix_app/bootstrap.dart';
import 'package:credix_app/core/utils/location_permission.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationPermission().requestLocationPermission();
  await bootstrap(() => const App());
}
