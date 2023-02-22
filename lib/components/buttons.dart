import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {

   Buttons(
    this.title, this.wPressed, this.color
  );

  String title;
  final wPressed;
  Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: wPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 20.0)),
    );
  }
}
