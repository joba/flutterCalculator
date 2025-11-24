import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/main.dart';
import 'package:flutter_calculator/widgets/display_widget.dart';

void main() {
  testWidgets('Calculator app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify the display shows initial state
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Can tap number buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap button '5'
    await tester.tap(find.text('5'));
    await tester.pump();

    expect(find.text('5'), findsWidgets);
  });

  testWidgets('Basic addition works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap: 2 + 3 =
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('+'));
    await tester.pump();
    await tester.tap(find.text('3'));
    await tester.pump();
    await tester.tap(find.text('='));
    await tester.pump();

    // Result should be 5
    expect(find.textContaining('5'), findsWidgets);
  });

  testWidgets('Clear button resets display', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Enter some numbers
    await tester.tap(find.text('5'));
    await tester.pump();
    await tester.tap(find.text('6'));
    await tester.pump();

    // Tap clear button (AC)
    await tester.tap(find.text('AC'));
    await tester.pump();

    // Find DisplayWidget and verify it shows '0'
    final displayWidget = find.byType(DisplayWidget);
    expect(displayWidget, findsOneWidget);
    expect(
      find.descendant(of: displayWidget, matching: find.text('0')),
      findsOneWidget,
    );
  });
}
