import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed("game"),
          child: Text("Retry")
        ),
        VerticalDivider(),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed("home"),
          child: Text("Exit")
        ), 
      ],
      content: Text(
        "Game Over",
        style: TextStyle(
          fontSize: 25
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  
  static void show(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "game-over-dialog",
      barrierDismissible: false,
      pageBuilder: (context, anim1, anim2) => GameOverDialog()
    );
  }
}

