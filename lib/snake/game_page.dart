import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_flutter/snake/game_state.dart';
import 'package:snake_flutter/widget/icon_button.dart';
import 'package:snake_flutter/snake/snake.dart';

class GamePage extends StatelessWidget {
  final double buttonSize = 35;

  @override
  Widget build(BuildContext context) {
    final size = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.9;

    return Scaffold(
      body: SafeArea(
        child: Provider(
          create: (ctx) => GameState(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 30),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: SnakeWidget(),
                ),
              ),
              Consumer<GameState>(
                builder:(ctx, gameState, child) => Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonIcon(
                            onPressed: gameState.up,
                            icon: Icon(Icons.keyboard_arrow_up_rounded, size: buttonSize)
                          )
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonIcon(
                            onPressed: gameState.left,
                            icon: Icon(Icons.keyboard_arrow_left_rounded, size: buttonSize)
                          ),
                          VerticalDivider(width: 50),
                          ButtonIcon(
                            onPressed: gameState.right,
                            icon: Icon(Icons.keyboard_arrow_right_rounded, size: buttonSize)
                          )
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonIcon(
                            onPressed: gameState.down,
                            icon: Icon(Icons.keyboard_arrow_down_rounded, size: buttonSize)
                          )
                        ]
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}