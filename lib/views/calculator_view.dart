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
      switch (value) {
        case 'E':
          if (_displayText.isNotEmpty) {
            _displayText = _displayText.substring(0, _displayText.length - 1);
          }
          break;
        case 'AC':
          _displayText = "";
          _labelText = null;
          break;
        case '=':
          _labelText = _displayText;
          _displayText = calculate(_displayText);
          break;
        default:
          _displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
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
