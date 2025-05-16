import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class UploadFileWidget extends StatefulWidget {
  final Function(String?) onFileSelected; // Callback to pass file path to parent

  const UploadFileWidget({super.key, required this.onFileSelected});

  @override
  _UploadFileWidgetState createState() => _UploadFileWidgetState();
}

class _UploadFileWidgetState extends State<UploadFileWidget> {
  String? fileName; // To store the selected file name
  String? filePath; // To store the selected file path

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Allow any image type
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        filePath = result.files.single.path;
      });
      widget.onFileSelected(filePath); // Pass file path to parent
    } else {
      widget.onFileSelected(null); // Notify parent if no file is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: pickFile,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(110.w, 45.h),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                backgroundColor: const Color(0xffFCA103),
              ),
              child: Text(
                "Choose file",
                style: TextStyles.font12WhiteRegular,
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
                    borderSide: const BorderSide(color: ColorsManager.mainYellow, width: 1.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  hintText: fileName ?? "No file chosen",
                  hintStyle: TextStyles.font12GreyRegular,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: const BorderRadius.only(
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