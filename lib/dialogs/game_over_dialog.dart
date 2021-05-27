import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            Text(
              "Game Over",
              style: TextStyle(
                fontSize: 25
              ),
              textAlign: TextAlign.center,
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
            )
          ],
        )
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

