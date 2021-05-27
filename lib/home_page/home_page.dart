import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed("game"),
                child: Text("Play")
              ),
            )
          ],
        )
      ),
    );
  }
}