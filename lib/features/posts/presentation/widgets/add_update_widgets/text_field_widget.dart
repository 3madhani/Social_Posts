import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validateText,
    required this.label,
    required this.hint,
    this.maxLines = 1,
  });
  final String validateText;
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return value!.isEmpty ? validateText : null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: label,
          hintText: hint,
          alignLabelWithHint: true,
        ),
        maxLines: maxLines,
      ),
    );
  }
}
