import 'package:flutter/material.dart';
import 'package:todo_list_provider/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final bool obscureText;
  const TodoListField({
    super.key,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
        isDense: true,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(TodoListIcons.eye),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
