import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class AddCartScreen extends StatefulWidget {
  const AddCartScreen({super.key});

  @override
  _AddCartScreenState createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  final _formKey = GlobalKey<FormState>();
  final holderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void dispose() {
    holderNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
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
        title: Text('Add Card', style: TextStyles.font14BlackRegular),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add Holder Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Add Holder Name", style: TextStyles.font14BlackSemi),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 320.w,
                  height: 48.h,
                  child: TextFormField(
                    controller: holderNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter cardholder name',
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
                        return 'Please enter cardholder name';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(16),
                // Card Number
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Card Number", style: TextStyles.font14BlackSemi),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 320.w,
                  height: 48.h,
                  child: TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      hintText: 'Enter card number',
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
                        return 'Please enter card number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Card number must contain only digits';
                      }
                      if (value.length != 16) {
                        return 'Card number must be 16 digits';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(16),
                // Expiry Date and CVV
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expiry Date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Expiry Date", style: TextStyles.font14BlackSemi),
                        verticalSpace(8),
                        SizedBox(
                          width: 150.w,
                          height: 46.h,
                          child: TextFormField(
                            controller: expiryDateController,
                            decoration: InputDecoration(
                              hintText: 'MM/YY',
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
                          ),
                        ),
                      ],
                    ),
                    // CVV
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVV", style: TextStyles.font14BlackSemi),
                        verticalSpace(8),
                        SizedBox(
                          width: 150.w,
                          height: 46.h,
                          child: TextFormField(
                            controller: cvvController,
                            decoration: InputDecoration(
                              hintText: 'Enter CVV',
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
                                return 'Please enter CVV';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'CVV must contain only digits';
                              }
                              if (value.length < 3 || value.length > 4) {
                                return 'CVV must be 3 or 4 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(90),
                // Continue Button
                Center(
                  child: SizedBox(
                    width: 221.w,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Card added successfully'),
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