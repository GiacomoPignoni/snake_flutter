import 'package:flutter/material.dart';
import 'package:snake_flutter/snake/game_page.dart';
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
      home: GamePage(),
    );
  }
}