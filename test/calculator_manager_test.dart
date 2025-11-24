import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/managers/calculator_manager.dart';
import 'package:flutter_calculator/utils/button_config.dart';

void main() {
  late CalculatorManager calculator;

  setUp(() {
    calculator = CalculatorManager();
    calculator.displayText = "0";
    calculator.labelText = null;
  });

  group('Basic Operations', () {
    test('Addition works correctly', () {
      calculator.displayText = "5+3";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "8");
    });

    test('Subtraction works correctly', () {
      calculator.displayText = "10-4";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "6");
    });

    test('Multiplication works correctly', () {
      calculator.displayText = "6×7";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "42");
    });

    test('Division works correctly', () {
      calculator.displayText = "20÷4";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "5");
    });

    test('Division by zero returns Error', () {
      calculator.displayText = "5÷0";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "Error");
    });
  });

  group('Complex Operations', () {
    test('Multiple operations work correctly', () {
      calculator.displayText = "2+3×4";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "14"); // Respects order of operations
    });

    test('Decimal numbers work correctly', () {
      calculator.displayText = "3.5+2.5";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "6");
    });
  });

  group('Button Operations', () {
    test('Clear button resets display to 0', () {
      calculator.displayText = "123";
      calculator.handleButtonPress(CalculatorButtons.clear);
      expect(calculator.displayText, "0");
      expect(calculator.labelText, null);
    });

    test('Backspace removes last character', () {
      calculator.displayText = "123";
      calculator.handleButtonPress(CalculatorButtons.backspace);
      expect(calculator.displayText, "12");
    });

    test('Backspace on single digit shows 0', () {
      calculator.displayText = "5";
      calculator.handleButtonPress(CalculatorButtons.backspace);
      expect(calculator.displayText, "0");
    });

    test('Number input replaces initial 0', () {
      calculator.displayText = "0";
      calculator.handleButtonPress("5");
      expect(calculator.displayText, "5");
    });

    test('Operator after 0 keeps the 0', () {
      calculator.displayText = "0";
      calculator.handleButtonPress("+");
      expect(calculator.displayText, "0+");
    });
  });

  group('Plus/Minus Toggle', () {
    test('Toggle positive to negative', () {
      calculator.displayText = "56";
      calculator.handleButtonPress(CalculatorButtons.plusMinus);
      expect(calculator.displayText, "(-56)");
    });

    test('Toggle negative back to positive', () {
      calculator.displayText = "(-56)";
      calculator.handleButtonPress(CalculatorButtons.plusMinus);
      expect(calculator.displayText, "56");
    });

    test('Toggle in expression works on last number', () {
      calculator.displayText = "10+56";
      calculator.handleButtonPress(CalculatorButtons.plusMinus);
      expect(calculator.displayText, "10+(-56)");
    });

    test('Toggle negative number in expression', () {
      calculator.displayText = "10+(-56)";
      calculator.handleButtonPress(CalculatorButtons.plusMinus);
      expect(calculator.displayText, "10+56");
    });
  });

  group('Edge Cases', () {
    test('Empty expression handling', () {
      calculator.displayText = "0";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.displayText, "0");
    });

    test('Label text is set when equals is pressed', () {
      calculator.displayText = "5+3";
      calculator.handleButtonPress(CalculatorButtons.equals);
      expect(calculator.labelText, "5+3");
    });
  });
}
