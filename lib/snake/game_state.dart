import 'package:flutter/cupertino.dart';

class GameState {
  final int gridSize = 20;

  Offset dir = Offset(0, 0);

  List<Offset> snake = [
    Offset(2,0),
    Offset(1,0),
    Offset(0, 0)
  ];

  void up() {
    dir = Offset(0, -1);
  }

  void right() {
    dir = Offset(1, 0);
  }

  void down() {
    dir = Offset(0, 1);
  }

  void left() {
    dir = Offset(-1, 0);
  }

  void update() {
    bool canMove = this.dir != const Offset(0, 0);
    Offset newPos = snake[0] + dir;
    if(newPos.dx >= gridSize || newPos.dx < 0 || newPos.dy >= gridSize || newPos.dy < 0) {
      canMove = false;
    }

    if(canMove) {
      for(int i = snake.length - 1; i > 0; i--) {
        snake[i] = snake[i - 1];
      }

      snake[0] += this.dir;
    } 
  }
}