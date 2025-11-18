const breakpoint = 450;

final List<String> buttons = [
  '',
  'C',
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
  '',
  '÷',
  '4',
  '5',
  '6',
  'C',
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
