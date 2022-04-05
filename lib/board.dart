import 'dart:async';
import 'dart:math';

import 'package:final_exam_42551/widgets/grid.dart';
import 'package:final_exam_42551/widgets/menu.dart';
import 'package:final_exam_42551/widgets/mytitle.dart';
import 'package:final_exam_42551/widgets/reset.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
  var move = 0;
  var secondsPassed = 0;
  var random = Random();

  Timer? timer;
  static const duration = Duration(seconds: 1);
  bool isActive = false;

  @override
  initState() {
    super.initState();
    shuffleNumbers(numbers);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    timer ??= Timer.periodic(duration, (t) {
      starTime();
    });

    return SafeArea(
      child: Container(
        height: size.height,
        color: const Color(0xff00009F),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            MyTitle(size),
            Menu(move, secondsPassed, size),
            Grid(numbers, size, clickGrid),
            Reset(reset, size),
          ],
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    setState(() {
      if ((index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0) ||
          (index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0) ||
          (index - 4 >= 0 && numbers[index - 4] == 0) ||
          (index + 4 < 16 && numbers[index + 4] == 0)) {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
        checkWin();
      }
    });
  }

  void reset() {
    setState(() {
      numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
      shuffleNumbers(numbers);
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void starTime() {
    if (isActive) {
      setState(() {
        secondsPassed++;
      });
    }
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "You Win!!! \nYour time: $secondsPassed \nYour Moves: $move",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: RaisedButton(
                          onPressed: () {
                            reset();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var index = 0; index < list.length - 1; index++) {
      int next = list[index];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  shuffleNumbers(List list) {
    for (var moves = 0; moves <= 500; moves++) {
      var changed = false;
      while (!changed) {
        var randomNumber = (random.nextInt(16));
        if ((randomNumber - 1 >= 0 &&
                numbers[randomNumber - 1] == 0 &&
                randomNumber % 4 != 0) ||
            (randomNumber + 1 < 16 &&
                numbers[randomNumber + 1] == 0 &&
                (randomNumber + 1) % 4 != 0) ||
            (randomNumber - 4 >= 0 && numbers[randomNumber - 4] == 0) ||
            (randomNumber + 4 < 16 && numbers[randomNumber + 4] == 0)) {
          numbers[numbers.indexOf(0)] = numbers[randomNumber];
          numbers[randomNumber] = 0;
          moves++;
          changed = true;
        }
      }
    }
  }
}
