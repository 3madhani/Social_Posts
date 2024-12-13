import 'package:flutter/material.dart';

class SnackBarMessage {
  static void showSuccessSnackBar({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green,
        content: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  static void showErrorSnackBar({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        content: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
