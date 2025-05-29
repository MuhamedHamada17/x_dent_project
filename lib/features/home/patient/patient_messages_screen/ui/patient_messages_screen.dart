import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/widgets/chat_patient_item.dart';
import '../logic/get_all_doctors_cubit.dart';
import '../logic/get_all_doctors_state.dart';
import 'package:x_dent_project/core/routing/routes.dart';

class PatientMessagesScreen extends StatelessWidget {
  const PatientMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<GetAllDoctorsCubit>()..fetchDoctors(),
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
                child: Row(
                  children: [

                    Expanded(
                      child: SizedBox(
                        height: 38.h,
                        child: SearchTextForm(
                          borderColor: ColorsManager.Black,
                          hintStyle: TextStyles.font12GreyRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<GetAllDoctorsCubit, GetAllDoctorsState>(
                builder: (context, state) {
                  print('PatientMessagesScreen: State: $state'); // Debug state
                  return state.maybeWhen(
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: ColorsManager.Blue,
                      ),
                    ),
                    success: (data) => ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (context, index) {
                        return ChatPatientItem(allDoctor: data.data[index]);
                      },
                    ),
                    error: (error) => Center(child: Text(error.message)),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}