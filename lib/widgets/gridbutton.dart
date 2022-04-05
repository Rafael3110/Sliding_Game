import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  VoidCallback click;
  String text;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: ((int.parse(text)) % 2) == 0 ? Colors.black: Colors.white,
        ),
      ),
      color: ((int.parse(text)) % 2) == 0 ? Colors.white : Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: click,
    );
  }
}
