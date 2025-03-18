import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'speciality_card.dart';

class AllSpecialtiesGrid extends StatelessWidget {
  const AllSpecialtiesGrid({super.key});

  final List<Map<String, String>> specialties = const [
    {"image": "assets/png/cavi.png", "name": "Cavities"},
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
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: specialties.length, // 3 rows × 3 columns - 1 item removed
        itemBuilder: (context, index) {
          return SpecialtyCard(
            image: specialties[index]["image"]!,
            name: specialties[index]["name"]!,
          );
        },
      ),
    );
  }
}
