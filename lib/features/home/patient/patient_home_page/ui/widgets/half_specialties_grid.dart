import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'speciality_card.dart';

class HalfSpecialtiesGrid extends StatelessWidget {
  const HalfSpecialtiesGrid({super.key});

  final List<Map<String, String>> specialties = const [
    {"image": "assets/png/cavi.png", "name": "Cavities"},
    {"image": "assets/png/Dental.png", "name": "Dental Hygiene"},
    {"image": "assets/png/Implants.png", "name": "Implants"},
    {"image": "assets/png/orthopedicspng.png", "name": "Orthopedics"},
    {"image": "assets/png/Dentures.png", "name": "Dentures"},
    {"image": "assets/png/Radiology.png", "name": "Radiology"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // عدد الأعمدة
          crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
          mainAxisSpacing: 10, // المسافة بين العناصر عموديًا
          childAspectRatio: 1, // نسبة الأبعاد (مربع)
        ),
        itemCount: specialties.length,
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
