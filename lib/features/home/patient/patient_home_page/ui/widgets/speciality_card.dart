import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';

class SpecialtyCard extends StatelessWidget {
  final String image;
  final String name;

  const SpecialtyCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => context.pushNamed(Routes.DoctorListScreen),
      child: Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: ColorsManager.Blue,
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.mainYellow,
              width: 4, // ✅ تحديد البوردر فقط من الأسفل
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 50, height: 50),
            verticalSpace(10),
            SizedBox(
              width: 90.w, // ✅ التحكم في عرض النص داخل الحاوية
              child: Text(
                name,
                style: TextStyles.font14WhiteRegular,
                maxLines: 1, // ✅ منع النص الطويل من النزول لسطر آخر
                overflow: TextOverflow.ellipsis, // ✅ إذا كان طويلًا يتم اقتصاصه بـ ...
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
