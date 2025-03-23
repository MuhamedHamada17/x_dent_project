import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.font20BlackRegular),
          Text(value, style: TextStyles.font20BlackRegular),
        ],
      ),
    );
  }
}
