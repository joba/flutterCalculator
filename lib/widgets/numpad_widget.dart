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

            return GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio:
                    buttonAspectRatio, // Makes buttons slightly wider than tall
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                final value = buttons[index];
                final isOperator = ['+', '-', '×', '÷', '='].contains(value);

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isOperator
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => onButtonPressed(value),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
