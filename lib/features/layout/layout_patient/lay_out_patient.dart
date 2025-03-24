import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/patient_appoinment_screen.dart';
import '../../home/patient/patient_home_page/ui/screens/patient_home_page.dart';
import '../../home/patient/patient_messages_screen/ui/patient_messages_screen.dart';
import '../../home/patient/patient_profile_screen/screens/patient_profile_screen.dart';
import '../../home/patient/patient_upload_screen/ui/patient_upload_screen.dart';

class AppLayoutPatient extends StatefulWidget {
  const AppLayoutPatient({super.key});

  @override
  State<AppLayoutPatient> createState() => _AppLayoutPatientState();
}

class _AppLayoutPatientState extends State<AppLayoutPatient> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> screens = [
    const PatientHomePage(),
    const PatientAppoinmentScreen(),
    const PatientUploadScreen(),
    const PatientMessagesScreen(),
    const PatientProfileScreen(),
  ];

  void onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: screens.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: 390.w,
          height: 59.h,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 5,
            backgroundColor: ColorsManager.lighterBLUE,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: ColorsManager.Blue,
            unselectedItemColor: ColorsManager.Black,
            selectedLabelStyle: TextStyles.font12BlackRegular,
            unselectedLabelStyle: TextStyles.font12BlueRegular,
            onTap: onItemTapped,
            items: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.calendar_today, "Appointments", 1),
              _buildNavItem(Icons.upload_file, "Upload", 2),
              _buildNavItem(Icons.chat_bubble_outline, "Messages", 3),
              _buildNavItem(Icons.person, "Profile", 4),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
