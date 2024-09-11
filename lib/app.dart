import 'package:flutter/material.dart';
import 'package:weather/router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
        routerConfig: router,
      );
}