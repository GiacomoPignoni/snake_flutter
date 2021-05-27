import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:snake_flutter/dialogs/game_over_dialog.dart';

class GameState {
  final BuildContext _context;

  final int gridSize = 20;

  bool pause = false;

  Offset dir = Offset(0, 0);

  List<Offset> snake = [
    Offset(2,9),
    Offset(1,9),
    Offset(0,9)
  ];

  late Offset food;

  GameState(this._context) {
    this._generateNewFood();
  }

  void up() {
    if(dir.dy != 1) {
      dir = Offset(0, -1);
    } 
  }

  void right() {
    if(dir.dx != -1) {
      dir = Offset(1, 0);
    } 
  }

  void down() {
    if(dir.dy != -1) {
      dir = Offset(0, 1);
    } 
  }

  void left() {
    if(dir.dx != 1) {
      dir = Offset(-1, 0);
    } 
  }

  void update() {
    if(pause) return;
    if(dir.dx == 0 && dir.dy == 0) return;

    Offset newPos = snake[0] + dir;
    //Check out of screen
    if(newPos.dx >= gridSize || newPos.dx < 0 || newPos.dy >= gridSize || newPos.dy < 0) {
      _gameOver();
    } else {
      final lastPosition = snake[snake.length - 1];
      for(int i = snake.length - 1; i > 0; i--) {
        if(newPos == snake[i]) {
          _gameOver();
          break;
        }
        snake[i] = snake[i - 1];
      }

      snake[0] = newPos;

      if(snake[0] == this.food) {
        snake.add(lastPosition);
        this._generateNewFood();
      }
    }
  }

  void _generateNewFood() {
    final rnd = Random();
    food = Offset(rnd.nextInt(this.gridSize).toDouble(), rnd.nextInt(this.gridSize).toDouble());
  }

  void _gameOver() {
    pause = true;
    GameOverDialog.show(_context);
  }
}