import 'package:flutter/widgets.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          verticalSpace(30),
          Text("500 L.E",style: TextStyles.font34BlackBoldOpen,),
          verticalSpace(30),
          Row(
            children: [
              Text('Recipient',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('Dr. Ahmed Mahmoud',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(20),
          Row(
            children: [
              Text('Date',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('16/2/2025',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(20),

          Row(
            children: [
              Text('Reference',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('2000398466283',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(20),

          Row(
            children: [
              Text('Payment Method',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('Mastercard',style: TextStyles.font12BlackRegular,)

            ],
          ),
        ],
      ),
    );
  }
}
