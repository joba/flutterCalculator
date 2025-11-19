import 'package:flutter/material.dart';
import 'package:flutter_calculator/managers/calculator_manager.dart';
import 'package:flutter_calculator/widgets/display_widget.dart';
import 'package:flutter_calculator/widgets/numpad_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorManager _calculatorManager = CalculatorManager();

  String _displayText = "";
  String? _labelText;

  void _onButtonPressed(String value) {
    setState(() {
      _calculatorManager.handleButtonPress(value);
      _displayText = _calculatorManager.displayText;
      _labelText = _calculatorManager.labelText;
    });
  }

  @override
  Widget build(BuildContext context) {
    _displayText = _calculatorManager.displayText;
    _labelText = _calculatorManager.labelText;

    return Container(
      color: Colors.grey[600],
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DisplayWidget(text: _displayText, labelText: _labelText),
              NumPadWidget(onButtonPressed: _onButtonPressed),
            ],
          ),
        ),
      ),
    );
  }
}
