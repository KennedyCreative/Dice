import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dice(),
  ));
}

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int randomNumber = 1;
  List<int> historyNumber = [];

  void randomDice() {
    setState(() {
      Random random = Random();
      int randomNumber = random.nextInt(6) + 1;
      if (historyNumber.length >= 6) {
        historyNumber.removeAt(0);
      }
      historyNumber.add(randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: randomDice,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  'images/dice${randomNumber.toString()}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 0,
            child: SizedBox(
              height: 200,
              width: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: historyNumber.reversed.map((number) {
                  return Image.asset(
                    'images/dice$number.png',
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
