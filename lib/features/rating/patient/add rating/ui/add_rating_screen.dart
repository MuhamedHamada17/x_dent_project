import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/patient_appoinment_screen.dart';

class AddRatingDialogScreen extends StatefulWidget {
  const AddRatingDialogScreen({Key? key}) : super(key: key);

  @override
  State<AddRatingDialogScreen> createState() => _AddRatingDialogScreenState();
}

class _AddRatingDialogScreenState extends State<AddRatingDialogScreen> {
  int _rating = 0;         // لحفظ عدد النجوم المضغوطة
  String _reviewText = ''; // لحفظ نص المراجعة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // خلفية شفافة بحيث تظهر الشاشة الخلفية (PatientAppoinmentScreen)
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // الخلفية: شاشة المواعيد
          const PatientAppoinmentScreen(),
          // تأثير البلور على الخلفية (نفس طريقة ظهور Log Out)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          // مركز النافذة المنبثقة (AlertDialog)
          Center(
            child: AlertDialog(
              backgroundColor: ColorsManager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                "Add Review",
                style: TextStyles.font28BlackMedium,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // لتقليل تمدد النافذة
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صف النجوم مع حجم 45×45 لكل نجمة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        bool isStarSelected = index < _rating;
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          icon: isStarSelected
                          // عند التحديد: نجمة كاملة باللون الأزرق
                              ? Icon(Icons.star, color: ColorsManager.Blue, size: 40)
                          // عند عدم التحديد: نجمة مركبة؛ الخارجي أزرق والداخلي أبيض
                              : Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.white, size: 40),
                              Icon(Icons.star_border, color: ColorsManager.Blue, size: 40),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 16.h),
                    // حقل نص المراجعة
                    Text(
                      "Enter Review",
                      style: TextStyles.font14BlackSemi,
                    ),
                    SizedBox(height: 12.h),
                    TextField(
                      minLines: 3,
                      maxLines: 5,
                      onChanged: (value) {
                        _reviewText = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Write your review...",
                      ),
                    ),
                  ],
                ),
              ),
              // الأزرار السفلية في صف واحد (Cancel على اليسار وConfirm على اليمين)
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Cancel", style: TextStyles.font22BlackMedium),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // تنفيذ منطق التأكيد (مثلاً حفظ التقييم)
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.Blue,
                      ),
                      child: Text("Confirm", style: TextStyles.font22WhiteMedium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
