import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_application/core/objectbox/movie_objectbox.dart';
import 'package:movie_application/core/objectbox/popular_objectbox.dart';
import 'package:movie_application/core/objectbox/toprated_objectbox.dart';
import 'package:movie_application/core/router/router.dart';
import 'package:movie_application/core/theme/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_application/core/theme/light_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MovieStoreObjectBox.createMethod();
  await PopularObjectBox.createMethod();
  await TopRatedObjectBox.createMethod();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      theme: ref.watch(lightThemeProvider),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
