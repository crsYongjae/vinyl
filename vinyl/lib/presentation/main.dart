import 'package:flutter/material.dart';
import 'package:home_run/di/dependency_injector.dart';

void main() {
  DependencyInjector.register();

  runApp(const VinylApp());
}

class VinylApp extends StatelessWidget {
  const VinylApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
