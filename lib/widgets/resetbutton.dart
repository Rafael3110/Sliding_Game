import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  VoidCallback reset;

  ResetButton(this.reset);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: const Text(
        "RESET",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: reset,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
