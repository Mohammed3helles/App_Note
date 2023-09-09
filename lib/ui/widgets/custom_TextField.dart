import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.maxLines,
    this.onSaved,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      style: Theme.of(context).textTheme.labelMedium,
      cursorColor: NoteColor.primary,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: NoteColor.primary,
              fontSize: 20,
              fontWeight: FontWeight.w300),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder()),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: NoteColor.white),
        borderRadius: BorderRadius.circular(10));
  }
}
