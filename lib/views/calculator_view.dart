import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
              ),
              child: const Text(
                'Calculator display UI',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              color: Colors.grey[700],
              child: const Text(
                'Numpad and operations will be here',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
