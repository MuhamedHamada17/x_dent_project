import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_patient_list_repo.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_list_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_list_state.dart';
import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_service.dart';

class PatientFilesScreen extends StatelessWidget {
  const PatientFilesScreen({super.key});

  Future<Map<String, dynamic>> _getAuthData() async {
    final token = await SharedPrefHelper.getSecuredString('access_token');
    final doctorId = await SharedPrefHelper.getInt('doctor_id');
    return {'token': token, 'doctorId': doctorId};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _getAuthData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              children: [
                verticalSpace(200),
                CircularProgressIndicator(
                  color: ColorsManager.Blue,
                ),
              ],
            )),
          );
        }

        final token = snapshot.data!['token'] as String;
        final doctorId = snapshot.data!['doctorId'] as int;

        return Provider<DoctorPatientListRepository>(
          create: (_) => DoctorPatientListRepositoryImpl(ApiService(Dio())),
          child: BlocProvider(
            create: (context) => DoctorPatientListCubit(
              context.read<DoctorPatientListRepository>(),
            )..fetchDoctorPatientList(
                token: token,
              ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title:
                    Text("Patient List", style: TextStyles.font20BlackRegular),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Container(
                    color: ColorsManager.lighterBLUE,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42.h,
                          child: SearchTextForm(
                            borderColor: Colors.grey,
                            hintStyle: TextStyles.font12GreyRegular,
                          ),
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Sort by",
                                style: TextStyles.font12BlueRegular),
                            horizontalSpace(4),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: ColorsManager.Blue,
                            ),
                            horizontalSpace(8),
                          ],
                        ),
                        verticalSpace(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name", style: TextStyles.font14BlackRegular),
                            Text(
                              "First Appointment Date",
                              style: TextStyles.font12BlackRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<DoctorPatientListCubit,
                        DoctorPatientListState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: Text("Initializing...")),
                          loading: () => Center(
                              child: Column(
                            children: [
                              verticalSpace(200),
                              CircularProgressIndicator(
                                color: ColorsManager.Blue,
                              ),
                            ],
                          )),
                          success: (data) => ListView.separated(
                            itemCount: data.patients.length,
                            separatorBuilder: (context, index) => Divider(
                              height: 1,
                              color: ColorsManager.lighterBLUE,
                            ),
                            itemBuilder: (context, index) {
                              final patient = data.patients[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: GestureDetector(
                                  onTap: () async {
                                    // حفظ patientId في SharedPreferences
                                    await SharedPrefHelper.savePatientId(
                                        patient.id);
                                    debugPrint(
                                        'PatientFilesScreen: Navigating to PatientDetailsScreen with patientId: ${patient.id}');
                                    context.pushNamed(
                                      Routes.PatientDetailsScreen,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(patient.name,
                                          style: TextStyles.font16BlackRegular),
                                      Text(patient.appointmentDate,
                                          style: TextStyles.font16BlackRegular),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          error: (error) => Center(child: Text(error.message)),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: BlocBuilder<DoctorPatientListCubit,
                        DoctorPatientListState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Text(""),
                          loading: () => const Text(""),
                          success: (data) => Text(
                            "You currently have ${data.patients.length} patients.",
                            style: TextStyles.font14BlueRegular,
                          ),
                          error: (error) => Text(
                            "Error: ${error.message}",
                            style: TextStyles.font14BlueRegular,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
