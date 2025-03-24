import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int selectedIndex = 0; // 0 for FAQ, 1 for Contact Us

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            verticalSpace(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text("Help Center", style: TextStyles.font20BlackRegular),
                horizontalSpace(50),
              ],
            ),
            verticalSpace(20),
            Container(
              color: ColorsManager.Blue,
              height: 144.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: [
                  verticalSpace(15),
                  Text("How can we help?", style: TextStyles.font28WhiteMedium),
                  verticalSpace(15),
                  Image.asset(
                    "assets/png/Text_form.png",
                    width: 350.w,
                    height: 60.h,
                  ),
                ],
              ),
            ),
            verticalSpace(20),
      
            // **Row for FAQ and Contact Us**
            Row(
              children: [
                _buildTabItem("FAQ", 0),
                _buildTabItem("Contact Us", 1),
              ],
            ),
      
            // **Dynamic Image Based on Selection with Padding**
            verticalSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w), // ✅ إضافة بادينج أفقي
              child: selectedIndex == 0
                  ? Image.asset("assets/png/FAQ.png")
                  : Image.asset("assets/png/Contact_us.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          children: [
            Container(
              height: 47.h,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyles.font22BlackMedium,
              ),
            ),
            Container(
              height: 3.h, // سماكة الخط السفلي
              width: double.infinity,
              color: isSelected ? ColorsManager.Blue : ColorsManager.lighterBLUE,
            ),
          ],
        ),
      ),
    );
  }
}
