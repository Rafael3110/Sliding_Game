import 'package:final_exam_42551/widgets/resetbutton.dart';
import 'package:final_exam_42551/widgets/time.dart';
import 'package:flutter/material.dart';

import 'move.dart';

class Menu extends StatelessWidget {
  int move;
  int secondsPassed;
  var size;

  Menu(this.move,this.secondsPassed, this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Move(move),
          Time(secondsPassed)
        ],
      ),
    );
  }
}
