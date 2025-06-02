import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';

class TextFormWithName extends StatelessWidget {
  TextFormWithName({super.key, required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpace(25),
            Text(label, style: TextStyles.font14BlackSemiBold),
          ],
        ),
        verticalSpace(8),
        SizedBox(
          width: 330.w,
          height: 40.h,
          child: AppTextFormField(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.Grey.withOpacity(.8),
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.3),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
