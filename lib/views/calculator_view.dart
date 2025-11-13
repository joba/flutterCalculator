import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/display_widget.dart';
import 'package:flutter_calculator/widgets/numpad_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _displayText = "";
      } else if (value == '=') {
        // Simple evaluation logic can be added here
        // For now, just clear the display
        _displayText = "";
      } else {
        _displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DisplayWidget(text: _displayText),
            NumPadWidget(onButtonPressed: _onButtonPressed),
          ],
        ),
      ),
    );
  }
}
