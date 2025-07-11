import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_patient_treatment_plan_repository.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/add_plans.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/delete_treatment_plan_widget.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/edit_treatment_plan_widget.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/treatment_plan_row.dart';

class EditTreatmentPlanScreen extends StatelessWidget {
  const EditTreatmentPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: SharedPrefHelper.getPatientId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return BlocProvider(
          create: (context) => DoctorPatientTreatmentPlanCubit(
            GetIt.I<DoctorPatientTreatmentPlanRepository>(),
          )..fetchTreatmentPlans(snapshot.data!),
          child: Builder(
            builder: (blocContext) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text("Treatment Plan",
                    style: TextStyles.font20BlackRegular),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      color: ColorsManager.lighterBLUE,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status   Session",
                            style: TextStyles.font12BlackRegular,
                          ),
                          Text(
                            "Date",
                            style: TextStyles.font12BlackRegular,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: BlocBuilder<DoctorPatientTreatmentPlanCubit,
                            DoctorPatientTreatmentPlanState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () =>
                                  const Center(child: Text("جارٍ التحضير...")),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              success: (treatmentPlans) => ListView.builder(
                                itemCount: treatmentPlans.treatmentPlans.length,
                                itemBuilder: (context, index) {
                                  final plan =
                                      treatmentPlans.treatmentPlans[index];
                                  return TreatmentPlanRow(
                                    isActive: plan.status == 0,
                                    sessionName: plan.name,
                                    date: plan.date,
                                    planId: plan.id,
                                    onEdit: () {
                                      showDialog(
                                        context: context,
                                        builder: (dialogContext) =>
                                            BlocProvider.value(
                                          value: context.read<
                                              DoctorPatientTreatmentPlanCubit>(),
                                          child: EditTreatmentPlan(
                                            planId: plan.id,
                                            initialName: plan.name,
                                            initialDate: plan.date,
                                          ),
                                        ),
                                      );
                                    },
                                    onDelete: () {
                                      showDialog(
                                        context: context,
                                        builder: (dialogContext) =>
                                            BlocProvider.value(
                                          value: context.read<
                                              DoctorPatientTreatmentPlanCubit>(),
                                          child: DeleteTreatmentPlan(
                                            planId: plan.id,
                                            planName: plan.name,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              error: (error) => Center(
                                child: Text(
                                  error.message,
                                  style: TextStyles.font14RedRegular,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 40,
                      ),
                      child: Center(
                        child: AppTextButton(
                          borderRadius: 25,
                          verticalPadding: 4,
                          backgroundColor: ColorsManager.Blue,
                          buttonText: "Add Plan",
                          textStyle: TextStyles.font22WhiteMedium,
                          onPressed: () {
                            showDialog(
                              context: blocContext,
                              builder: (dialogContext) => BlocProvider.value(
                                value: blocContext
                                    .read<DoctorPatientTreatmentPlanCubit>(),
                                child: const DoctorCreateTreatment(),
                              ),
                            );
                          },
                        ),
                      ),
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
