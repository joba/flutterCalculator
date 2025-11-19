import 'package:flutter_calculator/utils/button_config.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorManager {
  CalculatorManager._internal();
  static final CalculatorManager _instance = CalculatorManager._internal();
  factory CalculatorManager() => _instance;

  String displayText = "";
  String? labelText;

  String _calculate(String inputString) {
    try {
      final GrammarParser parser = GrammarParser();
      Expression exp = parser.parse(
        inputString.replaceAll('×', '*').replaceAll('÷', '/'),
      );
      num eval = RealEvaluator().evaluate(exp);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }

  String _toggleNegativeNumbers(String inputString) {
    late String displayText = inputString;
    String lastInsertedNumber = '';
    int numberStartIndex = displayText.length;

    // Extract the last number from right to left
    for (int i = displayText.length - 1; i >= 0; i--) {
      final char = displayText[i];
      if (CalculatorButtons.operators.contains(char) && char != '-') {
        // Stop at operators (but not minus which could be negative sign)
        break;
      }
      lastInsertedNumber = char + lastInsertedNumber;
      numberStartIndex = i;
    }

    final prefix = displayText.substring(0, numberStartIndex);

    // Check if this is actually at the start or after an operator
    final isAfterOperator =
        prefix.isEmpty ||
        CalculatorButtons.operators.any(
          (op) => prefix.endsWith(op) && op != '-',
        );

    // Check if number is wrapped in parentheses: (-56)
    if (lastInsertedNumber.startsWith('(-') &&
        lastInsertedNumber.endsWith(')')) {
      // Remove parentheses and negative sign: (-56) -> 56
      final numWithoutParens = lastInsertedNumber.substring(
        2,
        lastInsertedNumber.length - 1,
      );
      displayText = prefix + numWithoutParens;
    } else if (lastInsertedNumber.startsWith('-') && isAfterOperator) {
      // Remove just the negative sign: -56 -> 56
      displayText = prefix + lastInsertedNumber.substring(1);
    } else if (isAfterOperator) {
      // Add the negative sign with parentheses: 56 -> (-56)
      displayText = '$prefix(-$lastInsertedNumber)';
    }
    return displayText;
  }

  void handleButtonPress(String value) {
    switch (value) {
      case CalculatorButtons.backspace:
        displayText = displayText.length == 1
            ? "0"
            : displayText.substring(0, displayText.length - 1);
        break;
      case CalculatorButtons.clear:
        displayText = "0";
        labelText = null;
        break;
      case CalculatorButtons.plusMinus:
        if (displayText.isNotEmpty) {
          displayText = _toggleNegativeNumbers(displayText);
        }
        break;
      case CalculatorButtons.equals:
        labelText = displayText;
        displayText = _calculate(displayText);
        break;
      default:
        if (displayText == "0" &&
            !CalculatorButtons.operators.contains(value) &&
            value != '.') {
          displayText = value;
        } else {
          displayText += value;
        }
    }
  }
}
