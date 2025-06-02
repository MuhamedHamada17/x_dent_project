import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/models/doctor_home_response_model.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.Blue.withOpacity(.8),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black.withOpacity(.7)),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Text(
                    "AZ",
                    style: TextStyle(color: ColorsManager.Grey),
                  ),
                ),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahmed Khaled", style: TextStyles.font20BlackRegular),
                  Text("Checkup", style: TextStyles.font12BlackRegular),
                ],
              ),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.Blue,
                ),

                child: Icon(Icons.phone, color: Colors.white, size: 30),
              ),
            ],
          ),
          verticalSpace(22),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 214, 152),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.Blue.withOpacity(.7),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: ColorsManager.Blue),
                    horizontalSpace(22),
                    Text("Wed, April 24", style: TextStyles.font10BlueRegular),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 3,
                      height: 16,
                      child: VerticalDivider(
                        color: ColorsManager.Blue,
                        width: 2,
                        thickness: 1.5,
                      ),
                    ),
                    horizontalSpace(12),
                    Icon(Icons.access_time, color: ColorsManager.Blue),
                    horizontalSpace(16),
                    Text("9:00-10:00", style: TextStyles.font10BlueRegular),
                    horizontalSpace(8),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
