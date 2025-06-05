// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_dent_project/core/helpers/spacing.dart';
// import 'package:x_dent_project/core/theiming/colors.dart';
// import 'package:x_dent_project/core/theiming/styles.dart';
// import 'package:x_dent_project/core/widgets/app_text_button.dart';
// import 'package:x_dent_project/core/widgets/app_text_form_field.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({super.key});

//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }

// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManager.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               verticalSpace(32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       size: 26,
//                       color: Colors.black,
//                     ),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   Text("Change Password", style: TextStyles.font20BlackRegular),
//                   horizontalSpace(50),
//                 ],
//               ),
//               verticalSpace(32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text("  Old Password", style: TextStyles.font20BlackRegular),
//                 ],
//               ),
//               verticalSpace(8),
//               SizedBox(
//                 width: 330.w,
//                 height: 40.h,
//                 child: AppTextFormField(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: ColorsManager.Grey.withOpacity(.8),
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1.3),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               verticalSpace(16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text("  New Password", style: TextStyles.font20BlackRegular),
//                 ],
//               ),
//               verticalSpace(8),
//               SizedBox(
//                 width: 330.w,
//                 height: 40.h,
//                 child: AppTextFormField(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: ColorsManager.Grey.withOpacity(.8),
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1.3),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               verticalSpace(16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "  Confirm New Password",
//                     style: TextStyles.font20BlackRegular,
//                   ),
//                 ],
//               ),
//               verticalSpace(8),
//               SizedBox(
//                 width: 330.w,
//                 height: 40.h,
//                 child: AppTextFormField(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: ColorsManager.Grey.withOpacity(.8),
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black, width: 1.3),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               verticalSpace(200),
//               SizedBox(
//                 width: 200,
//                 height: 50,
//                 child: AppTextButton(
//                   buttonText: " Save Change ",
//                   borderRadius: 20,
//                   verticalPadding: 4.h,
//                   backgroundColor: ColorsManager.Blue,
//                   textStyle: TextStyles.font22WhiteMedium,
//                   onPressed: () {},
//                 ),
//               ),
//               verticalSpace(8),
//               TextButton(
//                 onPressed: () {
//                   // Action for cancel
//                 },
//                 child: Text("Cancel", style: TextStyles.font22BlackMedium),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
