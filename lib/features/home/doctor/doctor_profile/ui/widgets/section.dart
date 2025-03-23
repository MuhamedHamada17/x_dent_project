import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class Section extends StatelessWidget {
  final String text;
  final List<Widget> children;
  const Section({required this.text, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: ColorsManager.lighterBLUE,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(text, style: TextStyles.font22BlackMedium),
        ),
        Column(children: children),
      ],
    );
  }
}
