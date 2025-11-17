import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String text;
  final String? labelText;

  const DisplayWidget({super.key, required this.text, this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(0, 20, 30, 0),
          child: Text(
            labelText ?? "",
            style: TextStyle(color: Colors.grey[600], fontSize: 24),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ],
    );
  }
}
