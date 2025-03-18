import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/widgets/appointmentCard.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/widgets/info_card.dart';
import 'package:x_dent_project/features/layout/layout_doctor/lay_out_doctor.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 230.h,
            color: ColorsManager.lighterBLUE,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  Welcome,\n  Dr Mohamed Ali",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(22),
                    SizedBox(
                      height: 42.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: " Search",
                          hintStyle: TextStyles.font14GreyRegular,
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    verticalSpace(32),
                    Row(
                      children: [
                        Column(
                          children: [
                            InfoCard(
                              title: "Total\nAppointments",
                              number: "12",
                              bgColor: ColorsManager.Blue,
                              textColor: Colors.white,
                            ),
                            verticalSpace(19),
                            Container(
                              width: 160.h,
                              height: 65.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsManager.lighterBLUE,
                                borderRadius: BorderRadius.circular(22),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorsManager.Blue.withOpacity(.7),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3.5),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Upcoming",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "6",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        horizontalSpace(16),
                        Column(
                          children: [
                            verticalSpace(5),
                            Text(
                              "   February 8,\n                2025",
                              textAlign: TextAlign.center,
                              style: TextStyles.font22BlackMedium,
                            ),
                            SizedBox(height: 15),
                            StatusCard(
                              title: "Completed",
                              number: "5",
                              color: Color(0xff029509),
                            ),
                            verticalSpace(16),
                            StatusCard(
                              title: "Canceled",
                              number: "1",
                              color: Color(0xffD51212),
                            ),
                            verticalSpace(8),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming Appointments",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(12),
                    AppointmentCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
