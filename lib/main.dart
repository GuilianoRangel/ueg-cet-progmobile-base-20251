import 'package:flutter/material.dart';
import 'package:modelo_app_flutter_20251/app/api/AppApi.dart';
import 'package:provider/provider.dart';


import 'core/config_state.dart';
import 'core/security-store.dart';
import 'my_app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = SecurityStore();

  final state = ConfigState(prefs: storage);

  final appApi = AppApi(config: state);

  runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => appApi,
            dispose: (_, instance) => instance.dispose(),)
        ],
        child: const MyApp(),
      ));
}




