import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/screens/doctor_appointment_detail_screen.dart';

class AppointmentsListWidget extends StatelessWidget {
  const AppointmentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12, // عدد المواعيد
      itemBuilder: (context, index) {
        bool isUpcoming = index < 2; // تحديد الحالات القادمة والمكتملة
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  width: double.infinity,
                  color: ColorsManager.lighterBLUE,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Saturday 8/2/2025",
                    style: TextStyles.font12BlackRegular,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ahmed Khaled", style: TextStyles.font14BlackRegular),
                  Row(
                    children: [
                      Text("5:00PM", style: TextStyles.font14BlackRegular),
                      horizontalSpace(10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: ColorsManager.Blue),
                        ),
                        child: Text(
                          isUpcoming ? "Upcoming" : "Completed",
                          style: TextStyles.font16BlackRegular,
                        ),
                      ),
                      horizontalSpace(10),
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AppointmentDetailsScreen();
                                },
                              ),
                            ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 26,
                          color: ColorsManager.Blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
