import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/treatment_plan_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/treatment_plan_patient_state.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/treatment_plan_row_patient.dart';

import '../../../../../../core/di/dependency_injection.dart';

class TreatmentsPlansScreenPatient extends StatelessWidget {
  const TreatmentsPlansScreenPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TreatmentPlanPatientCubit>(
      create: (context) => getIt<TreatmentPlanPatientCubit>()..fetchTreatmentPlans(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Treatment Plan", style: TextStyles.font20BlackRegular),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(32),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                color: ColorsManager.lighterBLUE,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Status   Session",
                      style: TextStyles.font12BlackRegular,
                    ),
                    Text("Date  ", style: TextStyles.font12BlackRegular),
                  ],
                ),
              ),
              verticalSpace(8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: BlocConsumer<TreatmentPlanPatientCubit, TreatmentPlanPatientState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        error: (error) {
                          debugPrint('Treatment Plans UI Error: ${error.message}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message)),
                          );
                          if (error.message == 'No token found') {
                            context.pushNamed(Routes.loginPatientScreen);
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      debugPrint('Treatment Plans UI Building with state: $state');
                      return state.maybeWhen(
                        loading: () =>  Center(child: CircularProgressIndicator(
                          color: ColorsManager.Blue,
                        )),
                        success: (data) {
                          debugPrint('Treatment Plans UI Success: ${data.treatmentPlans.length} plans');
                          return ListView.builder(
                            itemCount: data.treatmentPlans.length,
                            itemBuilder: (context, index) {
                              final plan = data.treatmentPlans[index];
                              return TreatmentPlanRowPatient(
                                plan.status == 'completed', // افتراضي: completed إذا كانت الحالة "completed"
                                plan.name,
                                plan.date,
                              );
                            },
                          );
                        },
                        error: (error) => Center(child: Text(error.message)),
                        orElse: () => const SizedBox(),
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}