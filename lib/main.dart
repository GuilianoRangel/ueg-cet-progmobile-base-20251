import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

import 'main.route.dart';

part 'main.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

@Main()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Base para utilizar como modelo

  ThemeData createTheme(BuildContext context, Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: brightness,
      ),
      brightness: brightness,
      useMaterial3: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Nome da aplicação',
        debugShowCheckedModeBanner: false,
        theme: createTheme(context, Brightness.light),
        darkTheme: createTheme(context, Brightness.dark),
        themeMode: ThemeMode.system,
        routerConfig: Routefly.routerConfig(
          routes: routes,
          initialPath: routePaths.home,
        ));
  }
}


