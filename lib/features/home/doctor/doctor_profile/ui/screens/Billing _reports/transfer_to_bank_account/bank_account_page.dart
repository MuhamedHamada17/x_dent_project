import 'package:flutter/material.dart';
import 'package:x_dent_project/core/widgets/text_form_with_name.dart';

class BankAccountPage extends StatelessWidget {
  const BankAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormWithName(label: "Bank Name"),
        TextFormWithName(label: "Account Number"),
        TextFormWithName(label: "Amount"),
        TextFormWithName(label: "Password"),
      ],
    );
  }
}
