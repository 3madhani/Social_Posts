import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  const FormSubmitBtn({
    super.key,
    required this.isUpdate,
    required this.onPressed,
  });

  final bool isUpdate;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          icon: Icon(isUpdate ? Icons.edit : Icons.add),
          label: Text(
            isUpdate ? "Update" : "Add",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
