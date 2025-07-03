import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/data/repos/doctors_appointments_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_appointments_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/appointments_list_wdget.dart';
import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';

class DoctorAppointmentsScreen extends StatefulWidget {
  const DoctorAppointmentsScreen({super.key});

  @override
  State<DoctorAppointmentsScreen> createState() =>
      _DoctorAppointmentsScreenState();
}

class _DoctorAppointmentsScreenState extends State<DoctorAppointmentsScreen> {
  int selectedIndex = 7;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: SharedPrefHelper.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: ColorsManager.Blue,
          ));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('يرجى تسجيل الدخول أولاً'));
        }
        final token = snapshot.data!;
        return RepositoryProvider(
          create: (context) => DoctorsAppointmentsRepository(
            Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl))
              ..options.headers['Authorization'] = 'Bearer $token',
          ),
          child: BlocProvider(
            create: (context) => DoctorsAppointmentsCubit(
              context.read<DoctorsAppointmentsRepository>(),
            )..getAppointments(),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Appointments",
                    style: TextStyles.font20BlackRegular,
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Container(
                    color: ColorsManager.lighterBLUE,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 6, right: 16, left: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 42.h,
                            child: SearchTextForm(
                              borderColor: ColorsManager.Grey,
                              hintStyle: TextStyles.font16GreyRegular,
                            ),
                          ),
                          verticalSpace(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Sort by",
                                  style: TextStyles.font14BlueRegular),
                              horizontalSpace(8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: ColorsManager.Blue,
                              ),
                              horizontalSpace(8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorsManager.Blue,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("February 2025",
                            style: TextStyles.font14WhiteRegular),
                        Icon(Icons.keyboard_arrow_down,
                            color: Colors.white, size: 24),
                      ],
                    ),
                  ),
                  verticalSpace(8),
                  Container(
                    height: 50,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 30,
                            itemBuilder: (context, index) {
                              bool isSelected = index == selectedIndex;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    // يمكن إضافة استدعاء لجلب المواعيد بناءً على التاريخ هنا
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 4,
                                  ),
                                  child: Container(
                                    width: 35.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? ColorsManager.Blue
                                          : Colors.white,
                                      border:
                                          Border.all(color: ColorsManager.Blue),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : ColorsManager.Blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: AppointmentsListWidget()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
