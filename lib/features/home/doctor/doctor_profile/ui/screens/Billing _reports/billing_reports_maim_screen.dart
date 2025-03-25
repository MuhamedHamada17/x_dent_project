import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/billing_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/summary_card.dart';

class BillingReportsMainScreen extends StatelessWidget {
  const BillingReportsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Billing", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          verticalSpace(16),
          Container(
            height: 4.h,
            color: ColorsManager.lighterBLUE,
            padding: EdgeInsets.all(10.w),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    SummaryCard(
                      title: "Total Balance",
                      value: "5300.00 LE",
                      isBlue: true,
                    ),
                    horizontalSpace(10),
                    SummaryCard(
                      title: "Received Today",
                      value: "1400.00 LE",
                      isBlue: false,
                    ),
                  ],
                ),
                verticalSpace(16),
                Row(
                  children: [
                    TransferCard(),
                    horizontalSpace(10),
                    SummaryCard(
                      title: "Number of Payments this Month",
                      value: "58",
                      isBlue: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: Column(
              children: [
                Container(
                  color: ColorsManager.lighterBLUE,
                  padding: EdgeInsets.all(10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name", style: TextStyles.font14BlackRegular),
                      Text("Status", style: TextStyles.font14BlackRegular),
                      Text("Date", style: TextStyles.font14BlackRegular),
                    ],
                  ),
                ),
                verticalSpace(8),
                Expanded(
                  child: ListView(
                    children: [
                      BillingRow(
                        name: "Ahmed Khaled",
                        status: "Canceled",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Ahmed Yousef",
                        status: "Paid",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Ahmed Ziad",
                        status: "Canceled",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Asmaa Mohamed",
                        status: "Paid",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Bassant Gamal",
                        status: "Paid",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Dina Ali",
                        status: "Paid",
                        date: "18/12/2024",
                      ),
                      BillingRow(
                        name: "Fatma Ali",
                        status: "Paid",
                        date: "18/12/2024",
                      ),
                    ],
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

class TransferCard extends StatelessWidget {
  const TransferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(18.w),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: ColorsManager.lighterBLUE,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.Blue),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Transfer", style: TextStyles.font20BlueRegular),
            verticalSpace(18),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [Icon(Icons.account_balance), Text("Bank Account")],
                ),
                verticalSpace(8),

                Row(children: [Icon(Icons.paypal), Text("Paypal")]),
                verticalSpace(8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
