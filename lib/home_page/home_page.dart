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
              child: RichText(
                text: TextSpan(
                  text: "S",
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).accentColor
                  ),
                  children: [
                    TextSpan(
                      text: "nake Flutter",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor
                      )
                    )
                  ]
                ),
              ),
            ),
            Divider(),
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
