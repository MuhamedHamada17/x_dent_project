// import 'package:flutter/material.dart';
// import 'package:x_dent_project/core/helpers/extentions.dart';
// import 'package:x_dent_project/core/routing/routes.dart';
// import 'package:x_dent_project/core/theiming/colors.dart';
// import 'package:x_dent_project/core/theiming/styles.dart';

// class PatientsTable extends StatelessWidget {
//   PatientsTable({super.key});

//   final List<Map<String, String>> patients = [
//     {"name": "Ahmed Khaled", "date": "15/02/2023"},
//     {"name": "Ahmed Yousef", "date": "18/12/2024"},
//     {"name": "Ahmed Ziad", "date": "15/07/2024"},
//     {"name": "Asmaa Mohamed", "date": "08/10/2023"},
//     {"name": "Ayyya Atef", "date": "10/05/2023"},
//     {"name": "Bassant Gamal", "date": "24/03/2024"},
//     {"name": "ahmed Khaled", "date": "17/12/2023"},
//     {"name": "Bilal Tarek", "date": "15/02/2023"},
//     {"name": "Dina Ali", "date": "18/12/2024"},
//     {"name": "Dana Ahmed", "date": "15/07/2024"},
//     {"name": "Fady Yousef", "date": "08/10/2023"},
//     {"name": "Fatma Ali", "date": "10/05/2023"},
//     {"name": "Hassan Khaled", "date": "24/03/2024"},
//     {"name": "Ibrahim Samir", "date": "15/02/2023"},
//     {"name": "Lina Faris", "date": "18/12/2024"},
//     {"name": "Mazen Tamer", "date": "15/07/2024"},
//     {"name": "Salma Amr", "date": "08/10/2023"},
//     {"name": "Yara Amgad", "date": "10/05/2023"},
//     {"name": "Zeyad Omar", "date": "24/03/2024"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: patients.length,
//       separatorBuilder:
//           (context, index) =>
//               Divider(height: 1, color: ColorsManager.lighterBLUE),
//       itemBuilder: (context, index) {
//         final patient = patients[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: GestureDetector(
//             onTap: () {
//               context.pushNamed(Routes.PatientDetailsScreen);
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(patient["name"]!, style: TextStyles.font14BlackRegular),
//                 Text(patient["date"]!, style: TextStyles.font14BlackRegular),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
