import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/logic/doctor_home_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/logic/doctor_home_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/widgets/appointmentCard.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/widgets/info_card.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: SharedPrefHelper.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // التحقق من وجود التوكن
        final token = snapshot.data ?? '';
        if (!snapshot.hasData || token.isEmpty) {
          // التحقق إذا كان المستخدم مسجل دخوله أو في مرحلة الساين أب
          return FutureBuilder<bool>(
            future: SharedPrefHelper.checkIfLoggedInUser(),
            builder: (context, loginSnapshot) {
              if (loginSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (loginSnapshot.hasData && loginSnapshot.data == true) {
                // المستخدم مسجل لكن التوكن غير موجود
                return BlocProvider(
                  create: (context) =>
                      GetIt.I<DoctorHomeCubit>()..fetchDoctorHomeData(token),
                  child: _buildHomeContent(context),
                );
              } else {
                // المستخدم غير مسجل دخوله
                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('الرجاء إكمال التسجيل أو تسجيل الدخول'),
                        ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, '/signup'),
                          child: const Text('إكمال التسجيل'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, '/login'),
                          child: const Text('تسجيل الدخول'),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        }

        // إذا كان التوكن موجود، اعرض المحتوى
        return BlocProvider(
          create: (context) =>
              GetIt.I<DoctorHomeCubit>()..fetchDoctorHomeData(token),
          child: _buildHomeContent(context),
        );
      },
    );
  }

  Widget _buildHomeContent(BuildContext context) {
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
                        FutureBuilder<String>(
                          future: SharedPrefHelper.getFullName(),
                          builder: (context, nameSnapshot) {
                            final doctorName =
                                nameSnapshot.data?.isNotEmpty ?? false
                                    ? nameSnapshot.data!
                                    : 'Dr omar eid';
                            return Text(
                              "  Welcome\n  Dr $doctorName",
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
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
                      child: SearchTextForm(
                        borderColor: ColorsManager.Black,
                        hintStyle: TextStyles.font14GreyRegular,
                      ),
                    ),
                    verticalSpace(32),
                    BlocBuilder<DoctorHomeCubit, DoctorHomeState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: CircularProgressIndicator()),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (model) => Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      InfoCard(
                                        title: "Total  Appointments",
                                        number: model.totalAppointments
                                                ?.toString() ??
                                            '0',
                                        bgColor: ColorsManager.Blue,
                                        textColor: Colors.white,
                                      ),
                                      verticalSpace(19),
                                      Container(
                                        width: 160.h,
                                        height: 65.h,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: ColorsManager.lighterBLUE,
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorsManager.Blue
                                                  .withOpacity(.7),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3.5),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Upcoming",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              model.pendingAppointmentsCount
                                                      ?.toString() ??
                                                  '1',
                                              style: const TextStyle(
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
                                        "  February 8, \n                 2025",
                                        textAlign: TextAlign.center,
                                        style: TextStyles.font22BlackMedium,
                                      ),
                                      const SizedBox(height: 15),
                                      StatusCard(
                                        title: "Completed",
                                        number: model.completedAppointmentsCount
                                                ?.toString() ??
                                            '0',
                                        color: const Color(0xff029509),
                                      ),
                                      verticalSpace(16),
                                      StatusCard(
                                        title: "Canceled",
                                        number: model.canceledAppointmentsCount
                                                ?.toString() ??
                                            '0',
                                        color: const Color(0xffD51212),
                                      ),
                                      verticalSpace(16),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Upcoming Appointments",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    Text(
                                      " See All",
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
                          error: (error) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('خطأ: ${error.message}'),
                                ElevatedButton(
                                  onPressed: () async {
                                    final token =
                                        await SharedPrefHelper.getToken();
                                    context
                                        .read<DoctorHomeCubit>()
                                        .fetchDoctorHomeData(token);
                                  },
                                  child: const Text('إعادة المحاولة'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
