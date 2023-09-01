import 'package:flutter/material.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.onChanged,

  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      maxLength: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        counterText: '',
        border: border(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      );
  }
}
