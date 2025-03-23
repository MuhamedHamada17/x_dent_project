// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

// ignore: must_be_immutable
class DetectionsPage extends StatelessWidget {
  DetectionsPage({super.key});
  List<Map<String, dynamic>> detections = [
    {"color": ColorsManager.Red, "label": "Apical Lesion", "number": 1},
    {"color": Colors.orange, "label": "Existing Crown", "number": 1},
    {
      "color": Colors.yellow,
      "label": "Cavity",
      "number": 2,
      "textColor": Colors.black,
    },
    {"color": Colors.green, "label": "Existing Implant", "number": 1},
    {"color": ColorsManager.Blue, "label": "Existing Filling", "number": 2},
    {"color": Colors.purple, "label": "Existing Root Canal", "number": 1},
    {"color": Colors.pink, "label": "Inflammation", "number": 1},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(12),
            Center(child: Image.asset("assets/png/Xray_diagnoses.png")),
            verticalSpace(8),
            Text(
              "      You can click the image to expand.",
              style: TextStyles.font12BlackRegular,
            ),
            verticalSpace(10),
            Column(
              children:
                  detections.map((detection) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: detection["color"],
                        child: Text(
                          "${detection["number"]}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: detection["textColor"] ?? Colors.white,
                          ),
                        ),
                      ),
                      title: Text(
                        detection["label"],
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
