import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this._controller,
    required this.text,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
  });

  final TextEditingController _controller;
  final String text;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? obscureText : false,
      keyboardType: widget.keyboardType,
      controller: widget._controller,
      decoration: InputDecoration(
        labelText: widget.text,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(),
      ),
      validator: widget.validator,
    );
  }
}
