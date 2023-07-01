import 'package:flutter/material.dart';
import 'package:todo_list_provider/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    super.key,
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : obscureTextVN = ValueNotifier(obscureText),
        assert(obscureText == true ? suffixIconButton == null : true,
            'obscureText não pode ser enviado com suffixIconButton.');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
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
            suffixIcon: suffixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextValue;
                        },
                        icon: obscureTextValue
                            ? const Icon(TodoListIcons.eye)
                            : const Icon(TodoListIcons.eye_slash))
                    : null),
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
