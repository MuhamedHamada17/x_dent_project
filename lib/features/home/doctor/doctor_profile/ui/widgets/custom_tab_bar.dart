import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class CustomTabBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomTabBar({
    required this.currentIndex,
    required this.onTabSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyles.font12GreyRegular,
              children: [
                const TextSpan(text: "AI uses the "),
                TextSpan(
                  text: " Universal Dental Numbering System .\n",
                  style: TextStyles.font12BlueRegular,
                ),
                TextSpan(
                  text: "You can view analysis by detection or tooth number",
                  style: TextStyles.font12BlackRegular,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(22),
        Row(
          children: [
            Expanded(child: _buildTabButton("Detections", 0)),
            Expanded(child: _buildTabButton("Tooth", 1)),
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
                currentIndex == index ? ColorsManager.Blue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
