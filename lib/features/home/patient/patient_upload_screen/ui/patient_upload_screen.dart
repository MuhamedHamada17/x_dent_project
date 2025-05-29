import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/app_bar_patient_upload.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/browse_card_widget.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/upload_file_widget.dart';
import '../data/models/upload_xrays_request_model.dart';
import '../logic/upload_xrays_cubit.dart';
import '../logic/upload_xrays_state.dart';

class PatientUploadScreen extends StatefulWidget {
  const PatientUploadScreen({super.key});

  @override
  _PatientUploadScreenState createState() => _PatientUploadScreenState();
}

class _PatientUploadScreenState extends State<PatientUploadScreen> {
  String? selectedFilePath;
  double progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<UploadXraysCubit>(),
      child: BlocConsumer<UploadXraysCubit, UploadXraysState>(
        listener: (context, state) {
          state.when(
            initial: () => setState(() => progressValue = 0.0),
            loading: () => setState(() => progressValue = 0.5),
            success: (response) {
              setState(() => progressValue = 1.0);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم التحميل بنجاح!')),
              );
            },
            error: (error) {
              setState(() => progressValue = 0.0);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('خطأ: ${error.message}')),
              );
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const AppBarPatientUpload(),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UploadFileWidget(
                        onFileSelected: (filePath) {
                          setState(() => selectedFilePath = filePath);
                        },
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text("أو", style: TextStyles.font20BlackRegular),
                  const BrowseCardWidget(),
                  verticalSpace(20),
                  if (selectedFilePath != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/png/Avatar Icon.png",
                            width: 38.w,
                            height: 38.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            selectedFilePath!.split('/').last.replaceAll(' ', '_'),
                            style: TextStyles.font16BlackRegular,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFilePath = null;
                                progressValue = 0.0;
                              });
                            },
                            child: Image.asset(
                              "assets/png/trash-2.png",
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  verticalSpace(30),
                  LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.orange,
                    minHeight: 10.h,
                  ),
                  verticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 160.w,
                        height: 44.h,
                        child: AppTextButton(
                          buttonText: "Cancel",
                          borderRadius: 20,
                          verticalPadding: 4.h,
                          backgroundColor: ColorsManager.lighterBLUE,
                          textStyle: TextStyles.font20BlueRegular,
                          onPressed: () {
                            setState(() {
                              selectedFilePath = null;
                              progressValue = 0.0;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 160.w,
                        height: 44.h,
                        child: AppTextButton(
                          buttonText: "Upload",
                          borderRadius: 20,
                          verticalPadding: 4.h,
                          backgroundColor: ColorsManager.Blue,
                          textStyle: TextStyles.font20whiteRegular,
                          onPressed: selectedFilePath == null || state is UploadXraysLoading
                              ? null
                              : () async {
                            final token = await SharedPrefHelper.getSecuredString('access_token');
                            if (token.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('يجب تسجيل الدخول أولاً')),
                              );
                              return;
                            }

                            final cleanFileName = selectedFilePath!.split('/').last.replaceAll(' ', '_');
                            final file = await MultipartFile.fromFile(
                              selectedFilePath!,
                              filename: cleanFileName,
                            );

                            final request = UploadXraysRequest(image: file);
                            context.read<UploadXraysCubit>().uploadXrays(
                              token: token,
                              request: request,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}