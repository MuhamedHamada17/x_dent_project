import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class ProfileOptionPatient extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? imagePath; // ✅ دعم الصور
  final VoidCallback onTap;

  const ProfileOptionPatient({
    super.key,
    required this.title,
    this.icon,
    this.imagePath, // ✅ السماح بتمرير صورة
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
            // ✅ عرض الصورة إذا كانت موجودة، وإلا عرض الأيقونة
            if (imagePath != null)
              Image.asset(imagePath!, width: 26, height: 26) // ✅ صورة
            else if (icon != null)
              Icon(icon, color: ColorsManager.Black, size: 26), // ✅ أيقونة

            const SizedBox(width: 12),
            Expanded(child: Text(title, style: TextStyles.font20BlackRegular)),
            Icon(Icons.arrow_forward_ios, color: ColorsManager.Black, size: 18),
          ],
        ),
      ),
    );
  }
}
