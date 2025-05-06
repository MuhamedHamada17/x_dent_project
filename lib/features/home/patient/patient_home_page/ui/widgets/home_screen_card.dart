import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/upcoming_appointment_model.dart';

class HomeScreenCard extends StatelessWidget {
  final PendingAppointment appointment;

  const HomeScreenCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    String initials = '';
    if (appointment.doctorName.isNotEmpty) {
      final nameParts = appointment.doctorName.split(' ');
      initials = nameParts.length > 1
          ? '${nameParts[0][0]}${nameParts[1][0]}'
          : appointment.doctorName[0];
    }

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
                    initials.isNotEmpty ? initials : 'DR',
                    style: TextStyle(color: ColorsManager.Grey),
                  ),
                ),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.doctorName.isNotEmpty ? appointment.doctorName : 'Unknown Doctor',
                    style: TextStyles.font20BlackRegular,
                  ),
                  Text(
                    'Checkup', // مافيش حقل لنوع الموعد، فنستخدم نص افتراضي
                    style: TextStyles.font12BlackRegular,
                  ),
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
                    Text(
                      appointment.appointmentDate.isNotEmpty ? appointment.appointmentDate : 'N/A',
                      style: TextStyles.font10BlueRegular,
                    ),
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
                    Text(
                      appointment.appointmentTime.isNotEmpty ? appointment.appointmentTime : 'N/A',
                      style: TextStyles.font10BlueRegular,
                    ),
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