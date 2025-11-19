import 'package:flutter_calculator/utils/layout_constants.dart';

// Calculate columns based on available width
// Use 4 columns for narrow screens, 5 for wider screens
int getCrossAxisCount(double width) {
  return width > breakpoint ? 5 : 4;
}

double getGridPaddingAndMargin(double width) {
  return width > breakpoint ? 6 : 12;
}
