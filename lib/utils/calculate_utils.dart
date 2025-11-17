import 'package:math_expressions/math_expressions.dart';

String calculate(String inputString) {
  final GrammarParser parser = GrammarParser();
  Expression exp = parser.parse(
    inputString.replaceAll('×', '*').replaceAll('÷', '/'),
  );
  num eval = RealEvaluator().evaluate(exp);
  return eval.toString();
}
