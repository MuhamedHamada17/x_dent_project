import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class SpecialtyCard extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? onTap;

  const SpecialtyCard({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pushNamed(
        context,
        Routes.DoctorListScreen,
        arguments: {'specialization': name.toLowerCase()},
      ),
      child: Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: ColorsManager.Blue,
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.mainYellow,
              width: 4,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 50, height: 50),
            verticalSpace(10),
            SizedBox(
              width: 90.w,
              child: Text(
                name,
                style: TextStyles.font14WhiteRegular,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}