import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class UploadCVField extends StatefulWidget {
  const UploadCVField({super.key});

  @override
  _UploadCVFieldState createState() => _UploadCVFieldState();
}

class _UploadCVFieldState extends State<UploadCVField> {
  String? fileName; // To store the selected file name

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("  Upload CV", style: TextStyles.font14BlackSemiBold),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: pickFile,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(110.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                backgroundColor: Color(
                  0xffFCA103,
                ), // Matches the button in your UI
              ),
              child: const Text(
                "Choose file",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 210.w,
              height: 45.h,
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  fillColor: ColorsManager.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  hintText: fileName ?? "No file chosen",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
