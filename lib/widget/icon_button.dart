import 'package:flutter/material.dart';

class ButtonIcon extends StatefulWidget {
  final Function() onPressed;
  final Icon icon;

  ButtonIcon({
    required this.onPressed,
    required this.icon
  });

  @override
  _ButtonIconState createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  bool tapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => setState(() {
        tapDown = true;
      }),
      onTapUp: (details) => setState(() {
        tapDown = false;
      }),
      onTapCancel: () => setState(() {
        tapDown = false;
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (tapDown) ? HSLColor.fromColor(Theme.of(context).accentColor).withLightness(0.2).toColor() : Theme.of(context).accentColor,
          shape: BoxShape.circle
        ),
        child: widget.icon
      ),
    );
  }
}