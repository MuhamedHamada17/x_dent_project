import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/Billing%20_reports/transfer_to_bank_account/bank_account_page.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/Billing%20_reports/transfer_to_bank_account/paypal_page.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/custom_tab_bar.dart';

class TransferToBankAccountScreen extends StatefulWidget {
  const TransferToBankAccountScreen({super.key});

  @override
  State<TransferToBankAccountScreen> createState() =>
      _TransferToBankAccountScreenState();
}

class _TransferToBankAccountScreenState
    extends State<TransferToBankAccountScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Transfer", style: TextStyles.font20BlackRegular),
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
          CustomTabBar(
            currentIndex: _currentIndex,
            onTabSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            label1: 'Bank Account',
            label2: 'Paypal',
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [BankAccountPage(), PaypalPage()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 50),
            child: GestureDetector(
              onTap: () {},
              child: AppTextButton(
                borderRadius: 25,
                verticalPadding: 2,
                backgroundColor: ColorsManager.Blue,
                buttonText: "Confirm",
                textStyle: TextStyles.font22WhiteMedium,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
