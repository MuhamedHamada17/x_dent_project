import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class ListTimesWidget extends StatefulWidget {
  final String initialTime;
  final Function(String) onTimeSelected;
  final List<String> availableTimes;

  const ListTimesWidget({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
    required this.availableTimes,
  });

  @override
  _ListTimesWidgetState createState() => _ListTimesWidgetState();
}

class _ListTimesWidgetState extends State<ListTimesWidget> {
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.availableTimes.contains(widget.initialTime)
        ? widget.initialTime
        : widget.availableTimes.isNotEmpty
        ? widget.availableTimes.first
        : '';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.availableTimes.isEmpty) {
      return Center(
        child: Text(
          'No available times',
          style: TextStyles.font16BlueRegular,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.availableTimes.map((time) {
          return Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: _buildTimeButton(time),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTimeButton(String time) {
    bool isSelected = selectedTime == time;
    return SizedBox(
      width: 80.w,
      height: 37.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedTime = time;
            widget.onTimeSelected(time);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? ColorsManager.Blue : ColorsManager.lighterBLUE,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide.none,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : ColorsManager.Blue,
          ),
        ),
      ),
    );
  }
}