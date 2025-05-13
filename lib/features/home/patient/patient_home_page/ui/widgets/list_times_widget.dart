import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theiming/colors.dart';

class ListTimesWidget extends StatefulWidget {
  final String initialTime;
  final Function(String) onTimeSelected;

  const ListTimesWidget({
    Key? key,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _ListTimesWidgetState createState() => _ListTimesWidgetState();
}

class _ListTimesWidgetState extends State<ListTimesWidget> {
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTimeButton('7:00 PM'),
          SizedBox(width: 6),
          _buildTimeButton('8:00 PM'),
          SizedBox(width: 6),
          _buildTimeButton('9:00 PM'),
          SizedBox(width: 6),
          _buildTimeButton('10:00 PM'),
        ],
      ),
    );
  }

  Widget _buildTimeButton(String time) {
    bool isSelected = selectedTime == time;
    return SizedBox(
      width: 80.w,
      height: 37.h, // تعديل الارتفاع إلى 25.h
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTime = time;
            widget.onTimeSelected(time);
          });
        },
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : ColorsManager.Blue,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? ColorsManager.Blue : ColorsManager.lighterBLUE,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}