import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snake_flutter/game_page/game_state.dart';
import 'package:snake_flutter/widget/icon_button.dart';
import 'package:snake_flutter/game_page/snake.dart';

class GamePage extends StatelessWidget {
  final double buttonSize = 35;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);
    final size = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.9;
    final horizontal = (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height);

    return Scaffold(
      body: SafeArea(
        child: Provider(
          create: (ctx) => GameState(ctx),
          child: Consumer<GameState>(
            builder: (context, gameState, child) => RawKeyboardListener(
              focusNode: _focusNode,
              onKey: (event) => _handleKeyInput(event, gameState),
              child: Flex(
                direction: horizontal ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: horizontal ? const EdgeInsets.only() : const EdgeInsets.only(top: 100, bottom: 30),
                    child: SizedBox(
                      width: size,
                      height: size,
                      child: SnakeWidget(),
                    ),
                  ),
                  Padding(
                    padding: horizontal ? const EdgeInsets.only(left: 100) : const EdgeInsets.only(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleKeyInput(RawKeyEvent event, GameState gameState) {
    if(event.physicalKey == PhysicalKeyboardKey.arrowRight) {
      gameState.right();
    } else if(event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
      gameState.left();
    } else if(event.physicalKey == PhysicalKeyboardKey.arrowUp) {
      gameState.up();
    } else if(event.physicalKey == PhysicalKeyboardKey.arrowDown) {
      gameState.down();
    }
  }
}