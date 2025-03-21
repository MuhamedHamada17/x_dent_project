import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchTextForm extends StatelessWidget {
  SearchTextForm({
    super.key,
    required this.borderColor,
    required this.hintStyle,
  });
  Color borderColor;
  TextStyle hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: " Search",
        hintStyle: hintStyle,
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(32),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
