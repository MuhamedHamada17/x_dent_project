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
  final _cubit = GetIt.instance<DoctorAnalyzedImageCubit>();

  @override
  void initState() {
    super.initState();
    SharedPrefHelper.getToken().then((token) async {
      final imageId = await SharedPrefHelper.getInt('xray_image_id');
      final patientId = (imageId == 2 || imageId == 3) ? 2 : 1;
      await SharedPrefHelper.savePatientId(patientId);
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
      value: _cubit,
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
                      loading: () => Center(
                          child: Column(
                        children: [
                          verticalSpace(200),
                          CircularProgressIndicator(
                            color: ColorsManager.Blue,
                          ),
                        ],
                      )),
                      success: (response) => FutureBuilder<int>(
                        future: SharedPrefHelper.getInt('xray_image_id'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          final imageId = snapshot.data ?? 1;
                          final targetImageId = imageId == 2
                              ? 4
                              : imageId == 3
                                  ? 5
                                  : 4;
                          final selectedImage = response.data.isNotEmpty
                              ? response.data.firstWhere(
                                  (image) => image.id == targetImageId,
                                  orElse: () => response.data[0],
                                )
                              : null;
                          return IndexedStack(
                            index: _currentIndex,
                            children: [
                              DetectionsPage(
                                  imageUrl: selectedImage != null
                                      ? selectedImage.image_url
                                      : ''),
                              ToothPage(
                                  imageUrl: selectedImage != null
                                      ? selectedImage.image_url
                                      : ''),
                            ],
                          );
                        },
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
