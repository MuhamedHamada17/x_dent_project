import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => context.pop(),
        ),
        title: Text('Payment Method', style: TextStyles.font14BlackRegular),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Payment Method Options
            Column(
              children: [
                RadioListTile<String>(
                  title: Text('Visa', style: TextStyles.font12BlackRegular),
                  value: 'Visa',
                  groupValue: selectedPaymentMethod,
                  activeColor: ColorsManager.Blue,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Cash', style: TextStyles.font12BlackRegular),
                  value: 'Cash',
                  groupValue: selectedPaymentMethod,
                  activeColor: ColorsManager.Blue,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
              ],
            ),
            if (selectedPaymentMethod == null)
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 4.h),
                child: Text(
                  'Please select a payment method',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            verticalSpace(90),
            // Continue Button
            Center(
              child: SizedBox(
                width: 221.w,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: selectedPaymentMethod == null
                      ? null // تعطيل الزر إذا لم يتم اختيار طريقة دفع
                      : () {
                    if (selectedPaymentMethod == 'Visa') {
                      context.pushNamed(Routes.AddCartScreen);
                    } else if (selectedPaymentMethod == 'Cash') {
                      context.pushNamed(Routes.AddCartScreen);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorsManager.Blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}