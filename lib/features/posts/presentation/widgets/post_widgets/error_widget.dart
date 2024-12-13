import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  const ErrorDisplayWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          decoration: TextDecoration.none,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1.0,
        ),
      ),
    );
  }
}
