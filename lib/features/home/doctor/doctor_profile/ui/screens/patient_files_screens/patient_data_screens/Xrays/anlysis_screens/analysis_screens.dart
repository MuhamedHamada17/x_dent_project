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
            verticalSpace(16),
            CustomTabBar(
              currentIndex: _currentIndex,
              onTabSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
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
