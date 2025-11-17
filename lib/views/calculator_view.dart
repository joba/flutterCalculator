import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/calculate_utils.dart';
import 'package:flutter_calculator/widgets/display_widget.dart';
import 'package:flutter_calculator/widgets/numpad_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayText = "";
  String? _labelText;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _displayText = "";
        _labelText = null;
      } else if (value == '=') {
        _labelText = _displayText;
        _displayText = calculate(_displayText);
      } else {
        // _labelText = null;
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
            DisplayWidget(text: _displayText, labelText: _labelText),
            NumPadWidget(onButtonPressed: _onButtonPressed),
          ],
        ),
      ),
    );
  }
}
