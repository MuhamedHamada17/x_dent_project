import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.ChatScreen),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              right: 16,
              left: 16,
              top: 6,
            ),
            child: Column(
              children: [
                Row(
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
                                "Ahmed Mohamed",
                                style: TextStyles.font20BlackRegular,
                              ),
                              Text("9:32 AM",
                                  style: TextStyles.font14GreyRegular),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text("Okay.", style: TextStyles.font14GreyRegular),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: ColorsManager.lighterBLUE,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
                Row(
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
                                "mohamed hamada",
                                style: TextStyles.font20BlackRegular,
                              ),
                              Text("11:31 AM",
                                  style: TextStyles.font14GreyRegular)
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text("Okay.", style: TextStyles.font14GreyRegular),
                        ],
                      ),
                    ),
                  ],
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
