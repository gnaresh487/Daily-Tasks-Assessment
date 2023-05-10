import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.maxLength,
      this.isObscure,
      this.keyboardType,
      this.hintText,
      this.labelText})
      : super(key: key);
  final TextEditingController textEditingController;
  final int? maxLength;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLength: maxLength,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        hintText: hintText ?? '',
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Color.fromRGBO(232, 232, 232, 1))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
