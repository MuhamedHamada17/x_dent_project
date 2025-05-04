import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theiming/styles.dart';
import '../../logic/sign_up_patient_cubit.dart';
import '../../logic/sign_up_patient_state.dart';

class SignPatientBlocListener extends StatelessWidget {
  const SignPatientBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpPatientCubit, SignUpPatientState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
          success: (signPatientResponse) {
            context.pop();
            context.pushNamed(Routes.AppLayoutPatient); // تعديل الوجهة
          },
          error: (error) {
            setupErrorState(context, error.message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font28BlackSemiBoldOpen),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font28BlackSemiBoldOpen,
            ),
          ),
        ],
      ),
    );
  }
}