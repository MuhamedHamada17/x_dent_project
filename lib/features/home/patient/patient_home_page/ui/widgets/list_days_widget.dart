import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';

import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';

class ListDaysWidget extends StatefulWidget {
  final String initialDay;
  final Function(String) onDaySelected;
  final DoctorData doctorData;

  const ListDaysWidget({
    super.key,
    required this.initialDay,
    required this.onDaySelected,
    required this.doctorData,
  });

  @override
  _ListDaysWidgetState createState() => _ListDaysWidgetState();
}

class _ListDaysWidgetState extends State<ListDaysWidget> {
  late String selectedDay;

  @override
  void initState() {
    super.initState();
    final availableDays = widget.doctorData.schedules
        .map((schedule) => schedule.available_days)
        .toSet()
        .toList();
    selectedDay = availableDays.contains(widget.initialDay)
        ? widget.initialDay
        : availableDays.isNotEmpty
        ? availableDays.first
        : '';
  }

  String _formatDisplayDay(String day) {
    try {
      if (day.toLowerCase() == 'today') {
        return 'Today ${DateFormat('d MMM').format(DateTime.now())}';
      }
      final daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
      if (daysOfWeek.contains(day)) {
        final now = DateTime.now();
        int targetDayIndex = daysOfWeek.indexOf(day);
        int currentDayIndex = now.weekday - 1;
        int daysUntilTarget = (targetDayIndex - currentDayIndex + 7) % 7;
        if (daysUntilTarget == 0) daysUntilTarget = 7;
        final targetDate = now.add(Duration(days: daysUntilTarget));
        return DateFormat('d MMM').format(targetDate);
      }
      // إذا كان اليوم بصيغة "19 May" أو تاريخ
      final parsedDate = DateFormat('d MMM').parse(day);
      final now = DateTime.now();
      final year = parsedDate.month < now.month ? now.year + 1 : now.year;
      return DateFormat('d MMM').format(DateTime(year, parsedDate.month, parsedDate.day));
    } catch (e) {
      debugPrint('Error formatting display day: $e');
      return day;
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableDays = widget.doctorData.schedules
        .map((schedule) => schedule.available_days)
        .toSet()
        .toList();

    if (availableDays.isEmpty) {
      return Center(
        child: Text(
          "There are no appointments available",
          style: TextStyles.font16BlueRegular,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: availableDays.map((day) {
          final displayDay = _formatDisplayDay(day);
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: _buildDayButton(day, displayDay),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDayButton(String day, String displayDay) {
    bool isSelected = selectedDay == day;
    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedDay = day;
            widget.onDaySelected(day);
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
          displayDay,
          style: TextStyle(
            color: isSelected ? Colors.white : ColorsManager.Blue,
          ),
        ),
      ),
    );
  }
}