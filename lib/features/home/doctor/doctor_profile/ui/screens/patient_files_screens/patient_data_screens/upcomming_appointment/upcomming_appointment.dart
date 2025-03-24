import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/appointment_item.dart';

class UpcomingAppointmentsScreen extends StatefulWidget {
  const UpcomingAppointmentsScreen({super.key});

  @override
  State<UpcomingAppointmentsScreen> createState() =>
      _UpcomingAppointmentsScreenState();
}

class _UpcomingAppointmentsScreenState
    extends State<UpcomingAppointmentsScreen> {
  final List<String> plans = ["Align Teeth", "Check Up"];
  final List<String> dates = ["7/1/2025  ", "15/2/2025  "];

  List<bool> switchStates = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Upcoming Appointments",
          style: TextStyles.font20BlackRegular,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          verticalSpace(16),
          Container(
            color: ColorsManager.lighterBLUE,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 42.h,
                  child: SearchTextForm(
                    borderColor: Colors.grey,
                    hintStyle: TextStyles.font14GreyRegular,
                  ),
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sort by", style: TextStyles.font14BlueRegular),
                    horizontalSpace(4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: ColorsManager.Blue,
                    ),
                    horizontalSpace(8),
                  ],
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(" Plan", style: TextStyles.font14BlackRegular),
                    Text("Date   ", style: TextStyles.font12BlackRegular),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: plans.length,
              itemBuilder: (context, index) {
                return AppointmentItem(
                  plan: plans[index],
                  date: dates[index],
                  isSwitched: switchStates[index],
                  index: index,
                  switchStates: switchStates,
                  onStateChanged: () {
                    setState(() {
                      switchStates[index] = !switchStates[index];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
