import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  var size;

  MyTitle(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      padding: const EdgeInsets.all(5),
      child: Text(
        "Sliding Puzzle",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * .05,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
