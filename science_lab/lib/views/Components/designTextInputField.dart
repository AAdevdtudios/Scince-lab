import 'package:flutter/material.dart';
import 'package:science_lab/views/Constants/colors.dart';

class TextInputFieldDesign extends StatelessWidget {
  final String hint;
  final String validation;
  final Function onSave;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;

  const TextInputFieldDesign({Key key, this.hint = "Email", this.validation ="", this.onSave, this.obscureText = false, this.prefixIcon, this.suffixIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          filled: true,
          fillColor: blueGrayColor2,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
