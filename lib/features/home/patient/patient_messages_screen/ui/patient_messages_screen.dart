import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/widgets/chat_patient_item.dart';
class PatientMessagesScreen extends StatelessWidget {
  const PatientMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 32, right: 16, left: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 26,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 38.h,
                      child: SearchTextForm(
                        borderColor: ColorsManager.Black,
                        hintStyle: TextStyles.font12GreyRegular,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return const ChatPatientItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
