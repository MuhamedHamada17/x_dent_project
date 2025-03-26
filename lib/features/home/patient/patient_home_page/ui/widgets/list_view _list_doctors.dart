import 'package:flutter/material.dart';
import 'doctor_card_widget.dart';

class ListViewDoctors extends StatelessWidget {
  const ListViewDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة بأسماء الأطباء
    final List<String> doctorNames = [
      "Dr. Ahmed ",
      "Dr. Sara ",
      "Dr. Kareem ",
      "Dr. Fatma ",
      "Dr. Omar ",
      "Dr. Nourhan "
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctorNames.length, // ✅ عدد الأطباء في القائمة
      itemBuilder: (context, index) {
        return DoctorCardWidget(doctorName: doctorNames[index]); // ✅ تمرير الاسم لكل كارت
      },
    );
  }
}
