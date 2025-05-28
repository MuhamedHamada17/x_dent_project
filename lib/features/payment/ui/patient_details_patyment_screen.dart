import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class PatientDetailsPaymentScreen extends StatefulWidget {
  const PatientDetailsPaymentScreen({super.key});

  @override
  _PatientDetailsPaymentScreenState createState() => _PatientDetailsPaymentScreenState();
}

class _PatientDetailsPaymentScreenState extends State<PatientDetailsPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final ageController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    ageController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => context.pop(),
        ),
        title: Text('Patient Details', style: TextStyles.font14BlackRegular),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Patient Name", style: TextStyles.font14BlackSemi),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 320.w,
                  height: 48.h,
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter patient name',
                      hintStyle: TextStyles.font12GreyRegular,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsManager.Grey.withOpacity(.8),
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter patient name';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(16),
                // Age
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Age", style: TextStyles.font14BlackSemi),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 320.w,
                  height: 48.h,
                  child: TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                      hintText: 'Enter age',
                      hintStyle: TextStyles.font12GreyRegular,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsManager.Grey.withOpacity(.8),
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter age';
                      }
                      if (int.tryParse(value) == null || int.parse(value) <= 0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(16),
                // Enter Message
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter Message", style: TextStyles.font14BlackSemi),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 320.w,
                  height: 64.h,
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter message',
                      hintStyle: TextStyles.font12GreyRegular,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsManager.Grey.withOpacity(.8),
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 1.3),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(40),
                // Continue Button
                Center(
                  child: SizedBox(
                    width: 221.w,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed(Routes.PaymentMethodScreen);
                        if (_formKey.currentState!.validate()) {
                          // يمكن إضافة منطق إضافي هنا، مثل الانتقال إلى شاشة أخرى
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Details submitted successfully'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: ColorsManager.Blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}