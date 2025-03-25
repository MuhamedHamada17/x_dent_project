import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/bill_detail_row.dart';

class BillDetailes extends StatelessWidget {
  const BillDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Bill Details", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          verticalSpace(32),
          Container(
            height: 4.h,
            color: ColorsManager.lighterBLUE,
            padding: EdgeInsets.all(10.w),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BillDetailsRow(label: "name", value: "Ahmed youssef"),
                    BillDetailsRow(label: "Date", value: "18/3/2025"),
                    BillDetailsRow(label: "Amount", value: "600 LE"),
                    BillDetailsRow(label: "Status", value: "Paid"),
                    BillDetailsRow(
                      label: "Refrence Number",
                      value: "3738373903399",
                    ),
                    BillDetailsRow(
                      label: "Payment Method",
                      value: "Mastercard",
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 110,
                    vertical: 50,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: AppTextButton(
                      borderRadius: 25,
                      verticalPadding: 2,
                      backgroundColor: ColorsManager.Blue,
                      buttonText: "Save Invoice",
                      textStyle: TextStyles.font22WhiteMedium,
                      onPressed: () {
                        context.pushNamed(Routes.TransferToBankAccountScreen);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
