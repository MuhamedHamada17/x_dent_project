import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_arrow.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/logic/display_xrays_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/logic/display_xrays_state.dart';
import '../../../../../../core/helpers/shared_pref_helper.dart';

class XraysPatientScreen extends StatelessWidget {
  const XraysPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: SharedPrefHelper.getSecuredString('access_token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final token = snapshot.data ?? '';
        if (token.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
          });
          return const Scaffold(
            body: Center(child: Text('Please log in')),
          );
        }

        return BlocProvider(
          create: (context) => GetIt.instance<DisplayXraysCubit>()
            ..fetchXrays('Bearer $token'),
          child: Scaffold(
            appBar: AppBar(
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
                        BlocBuilder<DisplayXraysCubit, DisplayXraysState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const Center(child: Text('No data')),
                              loading: () => const Center(child: CircularProgressIndicator()),
                              success: (response) {
                                if (response.xrays.isEmpty) {
                                  return const Center(child: Text('No x-rays found'));
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: response.xrays.asMap().entries.map((entry) {
                                      final xray = entry.value;
                                      final uploadedAt = xray.uploadedAt ?? 'unknown';
                                      return Column(
                                        children: [
                                          NameWithArrow(
                                            text: uploadedAt,
                                            onTap: () {
                                              if (xray.imageUrl != null) {
                                                context.pushNamed(
                                                  Routes.DisplayXraysScreen,
                                                  arguments: {
                                                    'imageUrl': xray.imageUrl,
                                                    'uploadedAt': uploadedAt,
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                      content: Text('Image link not available')),
                                                );
                                              }
                                            },
                                          ),
                                          if (entry.key < response.xrays.length - 1)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
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
                                  ),
                                );
                              },
                              error: (error) => Center(child: Text('خطأ: $error')),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}