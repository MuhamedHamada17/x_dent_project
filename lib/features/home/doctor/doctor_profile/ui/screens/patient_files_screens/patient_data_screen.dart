import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/patient_details_repo.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/patient_details_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/patient_details_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/info_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_arrow.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SharedPrefHelper.getToken(),
      builder: (context, tokenSnapshot) {
        if (tokenSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: ColorsManager.Blue,
            )),
          );
        }
        if (!tokenSnapshot.hasData || tokenSnapshot.data == null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Token not found. Please log in again.",
                    style: TextStyles.font16BlackRegular,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Go Back"),
                  ),
                ],
              ),
            ),
          );
        }
        final token = tokenSnapshot.data!;
        return FutureBuilder<int>(
          future: SharedPrefHelper.getPatientId(),
          builder: (context, patientIdSnapshot) {
            if (patientIdSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.Blue,
                )),
              );
            }
            if (!patientIdSnapshot.hasData || patientIdSnapshot.data == 0) {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Patient ID not found. Please select a patient.",
                        style: TextStyles.font16BlackRegular,
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Go Back"),
                      ),
                    ],
                  ),
                ),
              );
            }
            final patientId = patientIdSnapshot.data!;
            debugPrint('PatientDetailsScreen: Using patientId: $patientId');
            return Provider<PatientDetailsRepository>(
              create: (_) => PatientDetailsRepositoryImpl(ApiService(Dio())),
              builder: (context, child) {
                return BlocProvider(
                  create: (context) => PatientDetailsCubit(
                    context.read<PatientDetailsRepository>(),
                  )..fetchPatientDetails(
                      token: token,
                      patientId: patientId,
                    ),
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                      title:
                          BlocBuilder<PatientDetailsCubit, PatientDetailsState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => Text("Patient Details",
                                style: TextStyles.font20BlackRegular),
                            loading: () => Text("\n Loading...",
                                style: TextStyles.font20BlackRegular),
                            success: (data) => Text(
                              data.patient.name,
                              style: TextStyles.font20BlackRegular,
                            ),
                            error: (error) => Text("Error",
                                style: TextStyles.font20BlackRegular),
                          );
                        },
                      ),
                      centerTitle: true,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: BlocBuilder<PatientDetailsCubit,
                              PatientDetailsState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () =>
                                    const Center(child: Text("Please wait...")),
                                loading: () => Center(
                                    child: Column(
                                  children: [
                                    verticalSpace(200),
                                    CircularProgressIndicator(
                                      color: ColorsManager.Blue,
                                    ),
                                  ],
                                )),
                                success: (data) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Section(
                                      textStyles: TextStyles.font22BlackMedium,
                                      text: "Info",
                                      children: [
                                        InfoRow(
                                            label: "Phone",
                                            value: data.patient.phone ==
                                                    "Not Provided"
                                                ? "01027459622"
                                                : data.patient.phone),
                                        InfoRow(
                                            label: "Name",
                                            value: data.patient.name),
                                        InfoRow(
                                            label: "Email",
                                            value: data.patient.email),
                                        InfoRow(
                                            label: "Age",
                                            value:
                                                "${data.patient.age == "N/A" ? "18" : data.patient.age} Years"),
                                        InfoRow(label: "Gender", value: "Male"),
                                        InfoRow(
                                            label: "First Appt",
                                            value: data
                                                .patient.firstAppointmentDate),
                                        verticalSpace(10),
                                      ],
                                    ),
                                    Section(
                                      textStyles: TextStyles.font22BlackMedium,
                                      text: "Data",
                                      children: [
                                        verticalSpace(10),
                                        NameWithArrow(
                                          text: "Xrays",
                                          icon: Icons.folder,
                                          onTap: () {
                                            context
                                                .pushNamed(Routes.XraysScreen);
                                          },
                                        ),
                                        verticalSpace(10),
                                        NameWithArrow(
                                          text: "Medical Records",
                                          icon: Icons.description,
                                          onTap: () {
                                            context.pushNamed(
                                                Routes.MidicalRecordsScreen);
                                          },
                                        ),
                                        verticalSpace(16),
                                      ],
                                    ),
                                    Section(
                                      textStyles: TextStyles.font22BlackMedium,
                                      text: "Treatment Plans",
                                      children: [
                                        verticalSpace(16),
                                        NameWithArrow(
                                          text: "Treatments Plans",
                                          icon: Icons.monitor_heart,
                                          onTap: () {
                                            context.pushNamed(
                                                Routes.TreatmentPlanScreen);
                                          },
                                        ),
                                        verticalSpace(10),
                                        NameWithArrow(
                                          text: "Prescriptions",
                                          icon: Icons.medical_services,
                                          onTap: () {
                                            context.pushNamed(
                                                Routes.PrescriptionScreen);
                                          },
                                        ),
                                        verticalSpace(10),
                                        NameWithArrow(
                                          text: "Upcoming Appointments",
                                          icon: Icons.event,
                                          onTap: () {
                                            context.pushNamed(Routes
                                                .UpcomingAppointmentsScreen);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                error: (error) => Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        error.statusCode == 404
                                            ? "Patient not found or has no appointments with this doctor."
                                            : "Error: ${error.message}",
                                        style: TextStyles.font16BlackRegular,
                                        textAlign: TextAlign.center,
                                      ),
                                      verticalSpace(20),
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Go Back"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
