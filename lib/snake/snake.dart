import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_flutter/snake/game_state.dart';

class SnakeWidget extends StatefulWidget {
  final int fps;

  SnakeWidget({
    this.fps = 5
  });

  @override
  _SnakeWidgetState createState() => _SnakeWidgetState();
}

class _SnakeWidgetState extends State<SnakeWidget> {
  late final Timer timer;
  late GameState gameState;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: (1000 ~/ widget.fps).toInt()), _update);
  }

  @override
  Widget build(BuildContext context) {
    this.gameState = Provider.of<GameState>(context);

    return CustomPaint(
      painter: SnakePainter(
        snake: gameState.snake,
        snakeColor: Theme.of(context).primaryColor,
        headColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).backgroundColor,
        gridSize: gameState.gridSize
      ),
    );
  }

  void _update(Timer timer) {
    this.gameState.update();
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class SnakePainter extends CustomPainter {
  final List<Offset> snake;
  final Color snakeColor;
  final Color headColor;
  final Color backgroundColor;
  final int gridSize;

  SnakePainter({
    required this.snake,
    required this.snakeColor,
    required this.headColor,
    required this.backgroundColor,
    required this.gridSize
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset(0, 0) & size, Paint()..color = backgroundColor);
  
    final bodyPaint = Paint()..color = this.snakeColor;
    final hheadPaint = Paint()..color = this.headColor;
    final Size cellSize = Size(size.width / this.gridSize, size.height / this.gridSize);

    for(int i = 0; i < snake.length; i++) {
      final paint = (i == 0) ? hheadPaint : bodyPaint;
      final Offset newPosition = Offset(snake[i].dx * cellSize.width, snake[i].dy * cellSize.height);
      canvas.drawRRect(RRect.fromRectAndRadius(newPosition & cellSize, Radius.circular(5)), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}