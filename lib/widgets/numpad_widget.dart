import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/layout_utils.dart';

class NumPadWidget extends StatelessWidget {
  final Function(String) onButtonPressed;

  const NumPadWidget({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = getCrossAxisCount(constraints.maxWidth);
            final buttons = getButtons(constraints.maxWidth);
            final buttonAspectRatio = getButtonAspectRatio(
              constraints.maxWidth,
            );
            final gridPaddingAndMargin = getGridPaddingAndMargin(
              constraints.maxWidth,
            );

            return GridView.builder(
              padding: EdgeInsets.all(gridPaddingAndMargin),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: gridPaddingAndMargin,
                crossAxisSpacing: gridPaddingAndMargin,
                childAspectRatio:
                    buttonAspectRatio, // Makes buttons slightly wider than tall
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                final value = buttons[index];
                final button = getNumPadButton(value, context);

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => onButtonPressed(value),
                  child: button.content,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
