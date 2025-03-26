import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

// ignore: must_be_immutable
class NameWithArrow extends StatelessWidget {
  final String text;
  final IconData? icon;
  var onTap;

  NameWithArrow({required this.text, this.icon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) Icon(icon, size: 20),
                if (icon != null) SizedBox(width: 8),

                Text(text, style: TextStyles.font20BlackRegular),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
