import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/widgets/app_text_button.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Feb 17, 2025 - 10:00 AM",style: TextStyles.font22BlackMedium,),
            ],
          ),
          verticalSpace(15),

          Row(
            children: [
              Image.asset("assets/png/location_patient.png", width: 24.w, height: 24.h),
              const SizedBox(width: 4),
              Text("Gehan Street, Mansoura", style: TextStyles.font12GreyRegular),
            ],
          ),
          Row(
            children: [
              Image.asset("assets/png/Book_patient.png", width: 24.w, height: 24.h),
              const SizedBox(width: 4),
              Text("Booking ID:", style: TextStyles.font12GreyRegular),
              Text("#573DK98M", style: TextStyles.font12BlueRegular),
            ],
          ),
          verticalSpace(10),
          Image.asset("assets/png/map_patient.png",width: 370.w,height: 130.h,),
          verticalSpace(10),

          const Divider(color: ColorsManager.Grey),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Treatment Information",
              style: TextStyles.font14GreyRegular,),
            ],
          ),
          verticalSpace(20),

          Row(
            children: [
              Text('Dentist',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('Dr. Ahmed Mahmoud',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(10),

          Row(
            children: [
              Text('Treatment Type',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('Check Up',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(10),

          Row(
            children: [
              Text('Estimate Duration',style: TextStyles.font12BlackRegular,),
              Spacer(),
              Text('1 Hour',style: TextStyles.font12BlackRegular,)

            ],
          ),
          verticalSpace(20),

          const Divider(color: ColorsManager.Grey),
          verticalSpace(20),

          Row(
            children: [
              Text("Need to reschedule?",style: TextStyles.font20BlackRegular,),
              horizontalSpace(10),
              SizedBox(
                width: 118.w,
                height: 37.h,
                child: AppTextButton(
                  buttonText: "Reschedule",
                  borderRadius: 20,
                  verticalPadding: 4.h,
                  backgroundColor: ColorsManager.Blue,
                  textStyle: TextStyles.font14WhiteRegular,
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
