import 'package:flutter/material.dart';

class NumPadWidget extends StatelessWidget {
  final Function(String) onButtonPressed;

  const NumPadWidget({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      '7',
      '8',
      '9',
      '÷',
      '4',
      '5',
      '6',
      '×',
      '1',
      '2',
      '3',
      '-',
      '0',
      'C',
      '=',
      '+',
    ];

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final value = buttons[index];
          final isOperator = ['+', '-', '×', '÷', '=', 'C'].contains(value);

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
      ),
    );
  }
}
