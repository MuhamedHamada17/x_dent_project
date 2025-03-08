import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/spacing.dart';
import '../../core/theiming/colors.dart';
import '../../core/theiming/styles.dart';

class SwitchButtonScreen extends StatefulWidget {
  final Function(bool) onSwitchChanged;

  const SwitchButtonScreen({super.key, required this.onSwitchChanged});

  @override
  SwitchButtonScreenState createState() => SwitchButtonScreenState();
}

class SwitchButtonScreenState extends State<SwitchButtonScreen> {
  bool _isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
    widget.onSwitchChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80.w,
            height: 50.h,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: _isSwitched,
                onChanged: _toggleSwitch,
                activeColor: ColorsManager.white,
                inactiveThumbColor: ColorsManager.Blue,
                activeTrackColor: ColorsManager.Blue,
                inactiveTrackColor: ColorsManager.mainYellow,
              ),
            ),
          ),
          verticalSpace(55),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "I'm a ", style: TextStyles.font34BlackBoldOpen),
                TextSpan(
                  text: _isSwitched ? "Patient" : "Doctor",
                  style: TextStyles.font34BlueBoldOpen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
