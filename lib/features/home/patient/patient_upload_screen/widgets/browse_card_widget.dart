import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowseCardWidget extends StatelessWidget {
  const BrowseCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208.h,
      width: 340.w,
      child: Image.asset("assets/png/Drop File.png")
    );
  }
}
