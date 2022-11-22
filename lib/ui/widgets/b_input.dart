import 'package:flutter/material.dart';

class BInput extends StatelessWidget {
  const BInput({
    Key? key,
    this.inputType = TextInputType.name,
    this.maxLine = 16,
    this.width = 280,
    this.label = '',
    this.maxLength = 127,
    this.height = 50,
    this.multiLine = false,
    required this.onChange,
    this.controller,
  }) : super(key: key);

  final TextInputType inputType;
  final int maxLine, maxLength;
  final String label;
  final bool multiLine;
  final double width, height;
  final Function(String t) onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) => _input(context);

  Widget _input(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 18),
          maxLines: maxLine,
          maxLength: maxLength,
          onChanged: onChange,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 16),
            contentPadding: const EdgeInsets.all(16),
            filled: true,
            fillColor: Colors.white,
            counterText: '',
            enabledBorder: _baseBorderStyle(Colors.blue.shade900),
            focusedBorder: _baseBorderStyle(Colors.blue.shade900),
          ),
          keyboardType: inputType,
        ),
      );

  OutlineInputBorder _baseBorderStyle(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      );
}
