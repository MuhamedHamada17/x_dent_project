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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  int activeDot = 0;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // إعداد AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // مدة الأنيميشن
    );

    // إعداد Slide Animation (من تحت للمنتصف)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // من تحت الشاشة
      end: Offset.zero, // للمنتصف
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // إعداد Pulse Animation (نبض خفيف)
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // بدء الأنيميشن
    _controller.forward();

    // تغيير النقاط كل 500ms
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      setState(() {
        activeDot = (activeDot + 1) % 3;
      });
    });

    // الانتقال إلى شاشة الـ OnBoarding بعد 3 ثواني
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Blue,
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _slideAnimation.value * MediaQuery.of(context).size.height * 0.5,
                  child: Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Image.asset(
                      "assets/png/logo.png",
                      width: 161.w,
                      height: 227.h,
                    ),
                  ),
                );
              },
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