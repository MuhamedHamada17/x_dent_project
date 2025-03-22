import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: ColorsManager.Black, size: 26),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: TextStyles.font20BlackRegular)),
            Icon(Icons.arrow_forward_ios, color: ColorsManager.Black, size: 18),
          ],
        ),
      ),
    );
  }
}
