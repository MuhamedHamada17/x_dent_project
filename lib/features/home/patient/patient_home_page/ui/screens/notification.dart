import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, size: 40),
        ),
        title: Text(
          "Notification",
          style: TextStyles.font14BlackRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align "Today" to the start
          children: [
            verticalSpace(10),
            Text(
              "Today",
              style: TextStyles.font14BlackRegular,
            ),
            verticalSpace(14),
            Image.asset("assets/png/notification.png"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h), // Spacing around divider
              child: Divider(
                color: Colors.grey, // Grey color for divider
                thickness: 1, // Thickness of divider
              ),
            ),
            Image.asset("assets/png/notification_weekendpng.png"),
          ],
        ),
      ),
    );
  }
}
