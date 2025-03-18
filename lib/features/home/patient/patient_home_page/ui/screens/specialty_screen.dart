import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/app_bar_specialty.dart';

import '../widgets/all_specialties_grid.dart';

class SpecialtyScreen extends StatelessWidget {
  const SpecialtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white, // ✅ تأكيد أن الخلفية بيضاء
      body: Column(
        children: [
          AppBarSpecialty(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: ColorsManager.white,
              child:AllSpecialtiesGrid() ,
            ),
          ),
        ],
      ),
    );
  }
}
