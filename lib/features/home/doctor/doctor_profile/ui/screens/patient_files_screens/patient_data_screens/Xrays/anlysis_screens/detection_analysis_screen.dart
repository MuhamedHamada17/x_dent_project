import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class DetectionsPage extends StatelessWidget {
  final String imageUrl;
  DetectionsPage({super.key, required this.imageUrl});

  List<Map<String, dynamic>> detections = [
    {"color": ColorsManager.Blue, "label": "Apical Lesion", "number": 1},
    {"color": ColorsManager.Blue, "label": "Existing Crown", "number": 1},
    {
      "color": ColorsManager.Blue,
      "label": "Cavity",
      "number": 2,
      "textColor": Colors.white,
    },
    {"color": ColorsManager.Blue, "label": "Existing Implant", "number": 1},
    {"color": ColorsManager.Blue, "label": "Existing Filling", "number": 2},
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 11)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorsManager.Blue,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(12),
                  Center(
                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset("assets/png/Xray_diagnoses.png"),
                          )
                        : Image.asset("assets/png/Xray_diagnoses.png"),
                  ),
                  verticalSpace(8),
                  // Text(
                  //   "      You can click the image to expand.",
                  //   style: TextStyles.font12BlackRegular,
                  // ),
                  verticalSpace(20),
                  Text(
                    "   Number of detections per type",
                    style: TextStyles.font18BlackRegular,
                  ),
                  verticalSpace(10),
                  Column(
                    children: detections.map((detection) {
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
      },
    );
  }
}
