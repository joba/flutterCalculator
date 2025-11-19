import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/layout_constants.dart';

List<String> getButtons(double width) {
  return width > breakpoint
      ? CalculatorButtons.buttonsWiderScreen
      : CalculatorButtons.buttons;
}

double getButtonAspectRatio(double width) {
  return width > breakpoint ? 2 : 1;
}

({Color? backgroundColor, Widget content}) getNumPadButton(
  String value,
  BuildContext context,
) {
  final isOperator = CalculatorButtons.operators.contains(value);
  return (
    backgroundColor: isOperator
        ? Theme.of(context).colorScheme.primary
        : value.isEmpty
        ? Colors.grey[600]
        : Colors.grey[700],
    content: _getButtonContent(value),
  );
}

Widget _getButtonContent(String value) {
  return value == CalculatorButtons.backspace
      ? Icon(Icons.backspace_outlined, size: 26, color: Colors.grey[400])
      : Text(value, style: TextStyle(fontSize: 26, color: Colors.grey[400]));
}

class CalculatorButtons {
  static const String backspace = 'E';
  static const String clear = 'AC';
  static const String equals = '=';
  static const String plusMinus = '+/-';

  static const List<String> operators = ['+', '-', '×', '÷', '='];

  static const List<String> buttons = [
    backspace,
    clear,
    '',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    plusMinus,
    '0',
    '.',
    equals,
  ];

  static const List<String> buttonsWiderScreen = [
    '7',
    '8',
    '9',
    backspace,
    '÷',
    '4',
    '5',
    '6',
    clear,
    '×',
    '1',
    '2',
    '3',
    '',
    '-',
    plusMinus,
    '0',
    '.',
    equals,
    '+',
  ];
}
