import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String text;

  const DisplayWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 32),
      ),
    );
  }
}
