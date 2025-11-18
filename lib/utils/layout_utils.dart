import 'package:flutter/material.dart';

const breakpoint = 450;
const double maxWidth = 600;

final List<String> buttons = [
  'E',
  'AC',
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
  '',
  '0',
  '.',
  '=',
];
final List<String> buttonsWiderScreen = [
  '7',
  '8',
  '9',
  'E',
  '÷',
  '4',
  '5',
  '6',
  'AC',
  '×',
  '1',
  '2',
  '3',
  '',
  '-',
  '',
  '0',
  '.',
  '=',
  '+',
];

// Calculate columns based on available width
// Use 4 columns for narrow screens, 5 for wider screens
int getCrossAxisCount(double width) {
  return width > breakpoint ? 5 : 4;
}

List<String> getButtons(double width) {
  return width > breakpoint ? buttonsWiderScreen : buttons;
}

double getButtonAspectRatio(double width) {
  return width > breakpoint ? 2 : 1;
}

double getGridPaddingAndMargin(double width) {
  return width > breakpoint ? 6 : 12;
}

({Color? backgroundColor, Widget content}) getNumPadButton(
  String value,
  BuildContext context,
) {
  final isOperator = ['+', '-', '×', '÷', '='].contains(value);
  return (
    backgroundColor: isOperator
        ? Theme.of(context).colorScheme.primary
        : Colors.grey[700],
    content: _getButtonContent(value),
  );
}

Widget _getButtonContent(String value) {
  return value == 'E'
      ? Icon(Icons.backspace_outlined, size: 26, color: Colors.grey[100])
      : Text(value, style: TextStyle(fontSize: 26, color: Colors.grey[100]));
}
