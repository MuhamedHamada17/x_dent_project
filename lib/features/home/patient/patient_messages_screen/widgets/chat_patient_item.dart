import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import '../data/models/get_all_doctors_model.dart';

class ChatPatientItem extends StatelessWidget {
  final DoctorData allDoctor;

  const ChatPatientItem({super.key, required this.allDoctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.chatScreenPatient, arguments: allDoctor.id),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              right: 16,
              left: 16,
              top: 6,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: ColorsManager.lighterBLUE,
                  radius: 40,
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            allDoctor.name ?? "Mohamed Hamada",
                            style: TextStyles.font20BlackRegular,
                          ),
                          Text(
                            "9:32 AM", // Replace with dynamic time if available
                            style: TextStyles.font14GreyRegular,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: ColorsManager.lighterBLUE,
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ],
    );
  }
}