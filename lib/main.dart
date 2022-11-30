import 'package:api_learning/controller/provider.dart';
import 'package:api_learning/pages/detail_page.dart';
import 'package:api_learning/pages/favorite_page.dart';
import 'package:api_learning/pages/home_page.dart';
import 'package:api_learning/pages/splashscreen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => PokemonListProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => const SplashScreen(), settings: settings);
          case '/home':
            return CupertinoPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          case '/detail':
            return CupertinoPageRoute(
                builder: (_) => const DetailPage(), settings: settings);
          // testing
          case '/favorite':
            return CupertinoPageRoute(
                builder: (_) => const FavoritePage(), settings: settings);
        }
        return null;
      },
    );
  }
}
