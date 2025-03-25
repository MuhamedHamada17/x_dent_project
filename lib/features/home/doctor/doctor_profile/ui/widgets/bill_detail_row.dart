import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class BillDetailsRow extends StatelessWidget {
  final String label;
  final String value;
  BillDetailsRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
      child: Column(
        children: [
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130.w,
                child: Text(label, style: TextStyles.font14BlackRegular),
              ),
              SizedBox(width: 80.w),
              Text(value, style: TextStyles.font14BlackRegular),
            ],
          ),
        ],
      ),
    );
  }
}
