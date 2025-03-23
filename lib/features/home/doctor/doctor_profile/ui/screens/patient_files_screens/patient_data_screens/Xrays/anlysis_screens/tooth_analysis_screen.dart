// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

// ignore: must_be_immutable
class ToothPage extends StatelessWidget {
  ToothPage({super.key});
  List<Map<String, dynamic>> teeth = [
    {"number": 1, "label": "Existing Filling"},
    {"number": 3, "label": "Existing Crown\nExisting Root Canal"},
    {"number": 8, "label": "Cavity"},
    {"number": 13, "label": "Cavity"},
    {"number": 16, "label": "Inflammation"},
    {"number": 19, "label": "Existing Crown\nExisting Implant"},
    {"number": 27, "label": "Apical Lesion"},
    {"number": 31, "label": "Existing Filling"},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            Center(child: Image.asset("assets/png/Xray_diagnoses.png")),
            verticalSpace(8),
            Text(
              "       You can click the image to expand.",
              style: TextStyles.font12BlackRegular,
            ),
            verticalSpace(8),
            Column(
              children:
                  teeth.map((tooth) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.Blue),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundColor: ColorsManager.white,
                          child: Text(
                            "${tooth["number"]}",
                            style: TextStyles.font20BlackRegular,
                          ),
                        ),
                      ),
                      title: Text(
                        tooth["label"],
                        style: TextStyles.font20BlackRegular,
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
