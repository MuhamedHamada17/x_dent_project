import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class CustomTabBar extends StatelessWidget {
  final int currentIndex;
  String label1;
  String label2;

  final Function(int) onTabSelected;

  CustomTabBar({
    required this.currentIndex,
    required this.label1,
    required this.label2,

    required this.onTabSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildTabButton(label1, 0)),
            Expanded(child: _buildTabButton(label2, 1)),
          ],
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(title, style: TextStyles.font22BlackMedium),
          ),
          Container(
            height: 3,
            width: double.infinity,
            color:
                currentIndex == index
                    ? ColorsManager.Blue
                    : ColorsManager.lighterBLUE.withOpacity(.7),
          ),
        ],
      ),
    );
  }
}
