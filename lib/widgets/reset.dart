import 'package:final_exam_42551/widgets/resetbutton.dart';
import 'package:final_exam_42551/widgets/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Reset extends StatelessWidget {
  VoidCallback reset;
  var size;

  Reset(this.reset, this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            child: ResetButton(reset),
          ),
        ],
      ),
    );
  }
}
