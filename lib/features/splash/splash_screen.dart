import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';

import '../../core/helpers/spacing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeDot = 0;

  @override
  void initState() {
    super.initState();

    // تغيير النقاط كل 500ms
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      setState(() {
        activeDot = (activeDot + 1) % 3;
      });
    });

    // الانتقال إلى شاشة الـ OnBoarding بعد 30 ثانية
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Blue,
      body: Column(
        children: [
          const Spacer(),

          Center(
            child: Image.asset(
              "assets/png/logo.png",
              width: 161.w,
              height: 227.h,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: index == activeDot ? Colors.white : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),

          verticalSpace(50),
        ],
      ),
    );
  }
}
