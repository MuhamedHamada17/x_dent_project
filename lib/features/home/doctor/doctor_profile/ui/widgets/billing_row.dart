import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

// ignore: must_be_immutable
class BillingRow extends StatelessWidget {
  final String name;
  final String status;
  final String date;
  var ontap;
  BillingRow({
    super.key,
    required this.name,
    required this.status,
    required this.date,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.BillDetailes);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130.w,
                  child: Text(name, style: TextStyles.font14BlackRegular),
                ),
                SizedBox(
                  width: 80.w,

                  child: SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          status,
                          style: TextStyles.font14BlackRegular.copyWith(
                            color:
                                status == "Canceled"
                                    ? ColorsManager.Red
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(date, style: TextStyles.font14BlackRegular),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Divider(height: 4, color: ColorsManager.lighterBLUE),
            ),
          ],
        ),
      ),
    );
  }
}
