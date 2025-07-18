import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyles.font12BlackRegular),
              Text(value, style: TextStyles.font12BlackRegular),
            ],
          ),
        ),
      ],
    );
  }
}
