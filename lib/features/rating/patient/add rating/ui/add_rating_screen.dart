import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class AddRatingDialogScreen extends StatefulWidget {
  const AddRatingDialogScreen({Key? key}) : super(key: key);

  @override
  State<AddRatingDialogScreen> createState() => _AddRatingDialogScreenState();
}

class _AddRatingDialogScreenState extends State<AddRatingDialogScreen> {
  int _rating = 0;
  String _reviewText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Backdrop filter لإضافة تأثير البلور على الشاشة الخلفية
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              ? Icon(Icons.star, color: ColorsManager.Blue, size: 40)
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
                        // TODO: إضافة API call لإرسال التقييم
                        print("Rating: $_rating, Review: $_reviewText");
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