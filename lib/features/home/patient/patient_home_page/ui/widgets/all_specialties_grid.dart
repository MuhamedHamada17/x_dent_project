import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'speciality_card.dart';

class AllSpecialtiesGrid extends StatelessWidget {
  const AllSpecialtiesGrid({super.key});

  final List<Map<String, String>> specialties = const [
    {"image": "assets/png/cavi.png", "name": "Cavity"},
    {"image": "assets/png/Dental.png", "name": "Dental Hygiene"},
    {"image": "assets/png/Implants.png", "name": "Implants"},
    {"image": "assets/png/orthopedicspng.png", "name": "Orthopedics"},
    {"image": "assets/png/Dentures.png", "name": "Dentures"},
    {"image": "assets/png/Radiology.png", "name": "Radiology"},
    {"image": "assets/png/Periodontology.png", "name": "Periodontology"},
    {"image": "assets/png/Surgery.png", "name": "Surgery"},
    {"image": "assets/png/Cosmetic.png", "name": "Cosmetic"},
    {"image": "assets/png/Veneers.png", "name": "Veneers"},
    {"image": "assets/png/Extraction.png", "name": "Extraction"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: specialties.length,
        itemBuilder: (context, index) {
          final specialty = specialties[index];
          return SpecialtyCard(
            image: specialty["image"]!,
            name: specialty["name"]!,
            onTap: () {
              final specialization = specialty["name"]!.toLowerCase();
              if (specialization.isEmpty) {
                debugPrint('AllSpecialtiesGrid: Error - Specialization is empty');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error: No specialization selected')),
                );
                return;
              }
              debugPrint('AllSpecialtiesGrid: Navigating to DoctorListScreen with specialization: $specialization');
              context.pushNamed(
                Routes.DoctorListScreen,
                arguments: {'specialization': specialization},
              );
            },
          );
        },
      ),
    );
  }
}