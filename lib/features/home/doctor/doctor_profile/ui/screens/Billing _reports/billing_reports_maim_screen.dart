import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

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
                    children: const [
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

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isBlue;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.isBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isBlue ? ColorsManager.Blue : ColorsManager.lighterBLUE,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.Blue),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font14WhiteRegular.copyWith(
                color: isBlue ? Colors.white : Colors.black,
              ),
            ),
            verticalSpace(16),
            Text(
              value,
              style: TextStyles.font22WhiteMedium.copyWith(
                color: isBlue ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
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

class BillingRow extends StatelessWidget {
  final String name;
  final String status;
  final String date;

  const BillingRow({
    super.key,
    required this.name,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
