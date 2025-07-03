import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_arrow.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/show_patient_xray_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/show_patient_xray_state.dart';

class XraysScreen extends StatelessWidget {
  const XraysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: Future.wait([
        SharedPrefHelper.getSecuredString('access_token'),
        SharedPrefHelper.getInt('patient_id'),
      ]).then((results) => {
            'token': results[0],
            'patientId': results[1],
          }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                CircularProgressIndicator(
                  color: ColorsManager.Blue,
                ),
              ],
            )),
          );
        }

        final token = snapshot.data?['token'] ?? '';
        final patientId = snapshot.data?['patientId'] ?? 0;

        if (token.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please log in')),
            );
          });
          return const Scaffold(
            body: Center(child: Text('Please log in')),
          );
        }

        if (patientId == 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Patient ID not found')),
            );
          });
          return const Scaffold(
            body: Center(child: Text('Patient ID not found')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Xrays", style: TextStyles.font20BlackRegular),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  Section(
                    textStyles: TextStyles.font22BlackMedium,
                    text: "Uploaded Files",
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocProvider(
                          create: (context) =>
                              GetIt.instance<ShowPatientXrayCubit>()
                                ..fetchXray('Bearer $token', patientId),
                          child: BlocBuilder<ShowPatientXrayCubit,
                              ShowPatientXrayState>(
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox.shrink(),
                                loading: () => Center(
                                    child: Column(
                                  children: [
                                    verticalSpace(200),
                                    CircularProgressIndicator(
                                      color: ColorsManager.Blue,
                                    ),
                                  ],
                                )),
                                success: (response) {
                                  if (response.data.isEmpty) {
                                    return const Center(
                                        child: Text('No X-rays available'));
                                  }
                                  return Column(
                                    children: response.data
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      final xray = entry.value;
                                      final uploadedAt = xray.uploaded_at;
                                      final formattedDate =
                                          DateFormat('yyyy-MM-dd').format(
                                        DateTime.parse(uploadedAt),
                                      );
                                      return Column(
                                        children: [
                                          NameWithArrow(
                                            text: formattedDate,
                                            onTap: () {
                                              if (xray.image_url.isNotEmpty) {
                                                context.pushNamed(
                                                  Routes.XrayFileScreen,
                                                  arguments: {
                                                    'imageUrl': xray.image_url,
                                                    'uploadedAt': formattedDate,
                                                    'imageId': xray
                                                        .id, // تمرير imageId
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Image link not available')),
                                                );
                                              }
                                            },
                                          ),
                                          if (entry.key <
                                              response.data.length - 1)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8.0,
                                                vertical: 10,
                                              ),
                                              child: Divider(
                                                height: 1,
                                                color: ColorsManager.Grey,
                                              ),
                                            ),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                },
                                error: (error) =>
                                    Center(child: Text('Error: $error')),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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
