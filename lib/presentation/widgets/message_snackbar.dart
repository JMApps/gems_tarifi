import 'package:flutter/material.dart';

class MessageSnackBar extends StatelessWidget {
  const MessageSnackBar({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
