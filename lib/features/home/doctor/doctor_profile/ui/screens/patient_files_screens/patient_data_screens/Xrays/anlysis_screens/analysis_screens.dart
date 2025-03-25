import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/anlysis_screens/detection_analysis_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/anlysis_screens/tooth_analysis_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/custom_tab_bar.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
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
              child: IndexedStack(
                index: _currentIndex,
                children: [DetectionsPage(), ToothPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
