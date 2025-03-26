import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

// ignore: must_be_immutable
class NameWithSwitch extends StatefulWidget {
  final String text;
  final IconData? icon;
  var onTap;

  NameWithSwitch({required this.text, this.icon, this.onTap, super.key});

  @override
  State<NameWithSwitch> createState() => _NameWithSwitchState();
}

class _NameWithSwitchState extends State<NameWithSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text, style: TextStyles.font20BlackRegular),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: ColorsManager.Blue,
            ),
          ],
        ),
      ),
    );
  }
}
