import 'package:flutter/material.dart';
import 'package:snake_flutter/home_page/home_page.dart';
import 'package:snake_flutter/game_page/game_page.dart';
import 'package:snake_flutter/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Flutter',
      theme: theme,
      routes: {
        "home": (ctx) => HomePage(),
        "game": (ctx) => GamePage(),
      },
      initialRoute: "home",
    );
  }
}