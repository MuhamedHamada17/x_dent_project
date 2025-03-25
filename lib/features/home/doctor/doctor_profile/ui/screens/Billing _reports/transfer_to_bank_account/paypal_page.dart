import 'package:flutter/material.dart';
import 'package:x_dent_project/core/widgets/text_form_with_name.dart';

class PaypalPage extends StatelessWidget {
  const PaypalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormWithName(label: "paypal Username"),
        TextFormWithName(label: "Amount"),
        TextFormWithName(label: "Password"),
      ],
    );
  }
}
