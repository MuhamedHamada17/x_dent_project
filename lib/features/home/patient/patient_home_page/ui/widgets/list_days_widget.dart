import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';

class ListDaysWidget extends StatefulWidget {
  final String initialDay;
  final Function(String) onDaySelected;
  final DoctorData doctorData; // إضافة DoctorData

  const ListDaysWidget({
    Key? key,
    required this.initialDay,
    required this.onDaySelected,
    required this.doctorData, // معامل إجباري
  }) : super(key: key);

  @override
  _ListDaysWidgetState createState() => _ListDaysWidgetState();
}

class _ListDaysWidgetState extends State<ListDaysWidget> {
  late String selectedDay;

  @override
  void initState() {
    super.initState();
    // تحديد اليوم المختار بناءً على initialDay أو أول يوم متاح
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

  @override
  Widget build(BuildContext context) {
    // استخراج الأيام المتاحة من schedules
    final availableDays = widget.doctorData.schedules
        .map((schedule) => schedule.available_days)
        .toSet() // إزالة التكرارات
        .toList();

    if (availableDays.isEmpty) {
      return Center(
        child: Text(
          'لا توجد مواعيد متاحة',
          style: TextStyles.font16BlueRegular,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: availableDays.map((day) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: _buildDayButton(day),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDayButton(String day) {
    bool isSelected = selectedDay == day;
    return SizedBox(
      width: 100.w, // زيادة العرض لاستيعاب أسماء الأيام
      height: 35.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedDay = day;
            widget.onDaySelected(day);
          });
        },
        child: Text(
          day,
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