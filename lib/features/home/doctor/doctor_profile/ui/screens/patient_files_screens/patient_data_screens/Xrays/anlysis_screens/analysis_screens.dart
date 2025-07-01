import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_analyzed_image_repo.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_analyzed_image_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_analyzed_image_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/anlysis_screens/detection_analysis_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/anlysis_screens/tooth_analysis_screen.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/custom_tab_bar.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int _currentIndex = 0;
  final _cubit =
      GetIt.instance<DoctorAnalyzedImageCubit>(); // جلب الـ Cubit من GetIt

  @override
  void initState() {
    super.initState();
    // جلب التوكن ومعرف المريض باستخدام SharedPrefHelper
    SharedPrefHelper.getToken().then((token) async {
      final patientId = await SharedPrefHelper.getPatientId();
      if (token.isNotEmpty && patientId != 0) {
        _cubit.fetchAnalyzedImage(token, patientId);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('يجب تسجيل الدخول وتحديد معرف المريض')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit, // استخدام الـ Cubit الموجود من GetIt
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Analysis", style: TextStyles.font20BlackRegular),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child:
              BlocConsumer<DoctorAnalyzedImageCubit, DoctorAnalyzedImageState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                },
              );
            },
            builder: (context, state) {
              return Column(
                children: [
                  verticalSpace(22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: TextStyles.font12GreyRegular,
                        children: [
                          const TextSpan(text: "AI uses the "),
                          TextSpan(
                            text: " Universal Dental Numbering System .\n",
                            style: TextStyles.font12BlueRegular,
                          ),
                          TextSpan(
                            text:
                                "You can view analysis by detection or tooth number",
                            style: TextStyles.font12BlackRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  CustomTabBar(
                    currentIndex: _currentIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    label1: 'Detection',
                    label2: 'tooth',
                  ),
                  Expanded(
                    child: state.maybeWhen(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      success: (response) => IndexedStack(
                        index: _currentIndex,
                        children: [
                          DetectionsPage(
                              imageUrl: response.data.isNotEmpty
                                  ? response.data[0].image_url
                                  : ''),
                          ToothPage(
                              imageUrl: response.data.isNotEmpty
                                  ? response.data[0].image_url
                                  : ''),
                        ],
                      ),
                      error: (message) => Center(child: Text(message)),
                      orElse: () =>
                          const Center(child: Text('لا توجد بيانات متاحة')),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
