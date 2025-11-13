import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/display_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final String _displayText = "0";

  // void _onButtonPressed(String value) {
  //   setState(() {
  //     _displayText += value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DisplayWidget(text: _displayText),
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
