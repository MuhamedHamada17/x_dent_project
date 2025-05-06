import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/bloc_builder_home_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/half_specialties_grid.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({super.key});

  @override
  _PatientHomePageState createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  String userName = 'Guest'; // قيمة افتراضية

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String fullName = await SharedPrefHelper.getFullName();
    setState(() {
      userName = fullName.isNotEmpty ? fullName : 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetIt.instance<AppointmentPatientCubit>()..fetchUpcomingAppointments(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ColorsManager.lighterBLUE,
                  width: double.infinity,
                  height: 230.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome,\n$userName",
                            style: TextStyles.font28BlackMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: IconButton(
                              onPressed: () {
                                context.pushNamed(Routes.notification);
                              },
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(30),
                      SizedBox(
                        height: 42.h,
                        child: TextFormField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: " Search",
                            hintStyle: TextStyles.font14GreyRegular,
                            suffixIcon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        "Upcoming Appointments",
                        style: TextStyles.font14BlackRegular,
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            context.pushNamed(Routes.UpcomingAppointmentsScreen);
                          },
                          child: Text("See all", style: TextStyles.font12BlueRegular)),
                    ],
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocBuilderHomePatient(),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        "Dentist Specialty",
                        style: TextStyles.font14BlackRegular,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.specialtyScreen);
                        },
                        child: Text("See all", style: TextStyles.font12BlueRegular),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: HalfSpecialtiesGrid(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}